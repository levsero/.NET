using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6.Pages
{
    public partial class Discharge : System.Web.UI.Page
    {
        HospitalEntities2 he = new HospitalEntities2();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Get 'in' visits with no discharge from database and display.
                var query = from visits in he.visit
                            where (visits.PatientType == 0) &&
                                  (visits.DateOfDischarge == null)
                            select visits;
                GridView1.DataSource = query.ToList();
                GridView1.DataBind();

                //On page load display grid with select option.
                SetVisibility(true, false, false, "Select a patient to discharge.");
            }
        }
      
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the visit selected.
            GridViewRow row = GridView1.SelectedRow;
            int visitID = Convert.ToInt32(row.Cells[1].Text);
            visit pat = he.visit.Where(p => p.Id == visitID).First();
            
            // Hide gridview, shows price.          
            string msg = "Remember to wish " + pat.Patient.Name + " a full recovery and to stay healthy.";
            SetVisibility(false, true, false, msg);
            
            // Get number of days and the price per day, calculate display total.
            // Partial days are charged like a full day (so the +1).
            int days = (DateTime.Today - pat.DateOfVisit).Days;          
            decimal totalPrice = pat.Bed.RatePerDay * (days + 1);
            PriceLabel.Text = "The price for selected visit is " + totalPrice.ToString("C2") + ".";
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            // If canceled reshow gridview, hide price.
            SetVisibility(true, false, false, "Select a patient to discharge.");
            // Clear cc number
            cardNUM.Text = "";
        }

        protected void Discharge_Click(object sender, EventArgs e)
        {
            // Discharge button selected.
            // Get selected patient, add date of discharge.
            GridViewRow row = GridView1.SelectedRow;
            int visitID = Convert.ToInt32(row.Cells[1].Text);
            visit pat = he.visit.Where(p => p.Id == visitID).First();
            pat.DateOfDischarge = DateTime.Today;

            // Try to update DB, print results to screen
            try
            {
                he.SaveChanges();
                string msg = "Patient successfully discharged.";
                SetVisibility(false, false, true, successMsg: msg);           
            }
            catch
            {
                string msg = "Patient could not be discharged at this time, please try again.";
                SetVisibility(false, true, true, successMsg: msg);
            }
        }

        // Update view (visibility of panels and text messages).
        private void SetVisibility(bool GridView1B, bool PriceB, bool SuccessB, string instructionMsg = "", string successMsg = "")
        {
            GridView1.Visible = GridView1B;
            Price.Visible = PriceB;
            Success.Visible = SuccessB;

            // Only update messages if message specified.
            if (instructionMsg != "")
            {
                Instruction.Text = instructionMsg;
            }
            if (successMsg != "")
            {
                Success.Text = successMsg;
            }
        }

        // Gridview label name method.
        protected void TypeLabel_DataBinding(object sender, EventArgs e)
        {
            Label label = sender as Label;
            visit visit = GetDataItem() as visit;
            label.Text = visit.Patient.Name;
        }
    }
}