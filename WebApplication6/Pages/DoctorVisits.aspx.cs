using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6.Pages
{
    public partial class DoctorVisits : System.Web.UI.Page
    {
        HospitalEntities2 he = new HospitalEntities2();
        protected void Page_Load(object sender, EventArgs e)
        {
            var query = from docs in he.Doctor
                        select docs;

            // Make query an item list, use to create dropdown list of all doctors
            DropDownList1.DataSource = query.ToList();
            if (!IsPostBack)
            {
                // Create default select option
                DropDownList1.Items.Insert(0, new ListItem("Please Select", String.Empty));

                // Set Name as text and Id as values
                DropDownList1.DataValueField = "Id";
                DropDownList1.DataTextField = "Name";
                DropDownList1.DataBind();

                // This assumes no 2 patients have the same name
                DropDownList2.DataSource = he.Patient.ToList();
                // Set Name as text and Id as values
                DropDownList2.DataValueField = "id";
                DropDownList2.DataTextField = "Name";
                DropDownList2.DataBind();

                // Set visibilities of panels (all hidden)
                SetVisibility(false, false, false, false);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // When doctor selected
            // If default selection
            if (DropDownList1.SelectedIndex == 0)
            {
                return;
            }
            //Get all visits from selected doctor from database and display
            var docID = int.Parse(DropDownList1.SelectedValue);
            var query = from visits in he.visit
                        where (visits.DoctorId == docID)
                        select visits;
            GridView1.DataSource = query.ToList();
            GridView1.DataBind();
            PnlForGrdVw.Update();
            
            // Set visibilities of panels (grid and patient dropdown visible)
            SetVisibility(true, true, false, false);
        }

        protected void DisplayCreateVisit_Click(object sender, EventArgs e)
        {
            // Uses create bed type dropdown
            BedType.DataSource = he.Bed.ToList();
            // Set type as text and Id as values
            BedType.DataValueField = "Bedtype";
            BedType.DataTextField = "Bedtype";
            BedType.DataBind();            
            //hides any previous error
            BedError.Text = "";

            // Set visibilities of panels (patient dropdown and createVisit visible)
            SetVisibility(true, false, true, false);
        }

        protected void CreateVisit_Click(object sender, EventArgs e)
        {
            //removes any previous error
            BedError.Text = "";

            //create visit
            visit newVisit = new visit();
            newVisit.DoctorId = int.Parse(DropDownList1.SelectedValue);
            newVisit.PatientID = int.Parse(DropDownList2.SelectedValue);
            newVisit.PatientType = int.Parse(PatientType.SelectedValue);
            //int.tr
            if (PatientType.SelectedValue == "0")
            {
                int check = getEmptyBed();
                if (check != 0)
                {
                    newVisit.BedId = check;
                }
                else
                {
                    //display error and abort db update if no beds available
                    BedError.Text = "\nNo beds of this type available";
                    return;
                }
            }
            else
            {
                newVisit.BedId = null;
            }
            newVisit.Symptoms = Symptoms.Text;
            newVisit.Treatment = Treatment.Text;
            newVisit.Disease = Disease.Text;
            newVisit.DateOfVisit = DateTime.Today;
            he.visit.Add(newVisit);
            try
            {
                he.SaveChanges();
                Success.Text = "Visit created succesfully.";
                // Set visibilities of panels (patient dropdown and success visible)
                SetVisibility(true, false, false, true);
            }
            catch (Exception)
            {
                Success.Text = "Visit creation unsuccesful, please try again";
                // Set visibilities of panels (makes unsuccess visible)
                SetVisibility(true, false, true, true);
            }
        }

        //helper methods
        
        //returns the first empty BedID of selected type or 0 if no empty beds
        protected int getEmptyBed()
        {
            string type = BedType.SelectedValue;
            var query1 = (from beds in he.Bed
                          where (beds.Bedtype == type)
                          select beds.Id).ToList();
            var query2 = (from visits in he.visit
                          where (visits.PatientType == 0) &&
                                (visits.DateOfDischarge == null)
                          select visits.BedId).ToList();
            foreach (int vis in query2)
            {
                if (query1.Contains(vis))
                {
                    query1.Remove(vis);
                }
            }
            if (query1.Count != 0)
            {
                return query1.First();
            }
            else
            {
                return 0;
            }
        }

        //sets visibility for the panels
        private void SetVisibility(bool SlctPatPnlB, bool PnlForGrdVwB, bool CreateVisitPanelB, bool SuccessPanelB)
        {
            SlctPatPnl.Visible = SlctPatPnlB;
            PnlForGrdVw.Visible = PnlForGrdVwB;
            CreateVisitPanel.Visible = CreateVisitPanelB;
            SuccessPanel.Visible = SuccessPanelB;
        }

        //Gridview methods
        protected void TypeLabel_DataBinding(object sender, EventArgs e)
        {
            Label label = sender as Label;
            visit visit = GetDataItem() as visit;

            if (visit.PatientType == 0)
            {
                label.Text = "In";
            }
            else
            {
                label.Text = "Out";
            }
        }

        protected void TypeLabel_DataBinding2(object sender, EventArgs e)
        {
            Label label = sender as Label;
            visit visit = GetDataItem() as visit;
            label.Text = visit.Patient.Name;
        }
    }
}