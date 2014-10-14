using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6.Pages
{
    public partial class PatientRegistration : System.Web.UI.Page
    {
        private HospitalEntities2 he = new HospitalEntities2();
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Text = "Add Patient";
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    Patient pat = new Patient();
                    int s = Convert.ToInt32(Request.QueryString["id"]);
                    pat = he.Patient.Where(p => p.id == s).First();
                    name.Text = pat.Name;
                    address.Text = pat.Adress;
                    DayBox.Text = pat.DateOfBirth.Day.ToString();
                    MonthBox.Text = pat.DateOfBirth.Month.ToString();
                    YearBox.Text = pat.DateOfBirth.Year.ToString();
                    phone.Text = pat.Phone;
                    DayBox2.Text = pat.DateOfRegistration.Day.ToString();
                    MonthBox2.Text = pat.DateOfRegistration.Month.ToString();
                    YearBox2.Text = pat.DateOfRegistration.Year.ToString();
                    idBox.Text = pat.id.ToString();
                    Button1.Text = "Edit Patient";
                }
                else
                {
                    idBox.Text = "";
                    name.Text = "";
                    address.Text = "";
                    DayBox.Text = "";
                    MonthBox.Text = "";
                    YearBox.Text = "";
                    phone.Text = "";
                    //dateOf.Text = DateTime.Today.ToShortDateString();
                    DayBox.Text = DateTime.Today.Day.ToString();
                    MonthBox.Text = DateTime.Today.Month.ToString();
                    YearBox.Text = DateTime.Today.Year.ToString();
                }
            }            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // selects prev patient if editing
            if (idBox.Text != "")
            {
                int ids = Convert.ToInt32(idBox.Text);
                var query =
                    from pat in he.Patient
                    where pat.id == ids
                    select pat;
                foreach (Patient pat in query)
                {
                    pat.id = Convert.ToInt32(idBox.Text);
                    pat.Adress = name.Text;
                    pat.DateOfBirth = new DateTime(Convert.ToInt32(YearBox2.Text), Convert.ToInt32(MonthBox2.Text), Convert.ToInt32(DayBox2.Text)).Date;
                    pat.DateOfRegistration = new DateTime(Convert.ToInt32(YearBox.Text), Convert.ToInt32(MonthBox.Text), Convert.ToInt32(DayBox.Text)).Date;
                    pat.EmergencyContact = emergency.Text;
                    pat.Name = name.Text;
                    pat.Phone = phone.Text;
                }
                try
                {
                    he.SaveChanges();
                    Label1.Text = "Patient edit succesful";
                }
                catch (Exception)
                {
                    Label1.Text = "Patient edit unsuccesful";
                }
            }
            //else creates new patient
            else
            {
                Patient newPat = new Patient();
                newPat.Adress = address.Text;
                newPat.DateOfBirth = new DateTime(Convert.ToInt32(YearBox2.Text), Convert.ToInt32(MonthBox2.Text), Convert.ToInt32(DayBox2.Text)).Date;
                newPat.DateOfRegistration = new DateTime(Convert.ToInt32(YearBox.Text), Convert.ToInt32(MonthBox.Text), Convert.ToInt32(DayBox.Text)).Date;
                newPat.EmergencyContact = emergency.Text;
                newPat.Name = name.Text;
                newPat.Phone = phone.Text;
                he.Patient.Add(newPat);
                try
                {
                    //add to database
                    he.SaveChanges();
                    Label1.Text = "Patient registration succesful";
                }
                catch (Exception)
                {
                    //if can't add
                    Label1.Text = "Patient registration unsuccesful";
                    he.Patient.Remove(newPat);
                }
            }
        }
    }
}