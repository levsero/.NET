using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private HospitalEntities2 he = new HospitalEntities2();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //get patients from database and display
            var query = from patient in he.Patient
                        select patient;            
            GridView1.DataSource = query.ToList();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string url = "~/Pages/PatientRegistration.aspx?id=" + row.Cells[1].Text;
            Response.Redirect(url);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string input = TextBox1.Text;
            var query2 = from patient in he.Patient.Where(patient => patient.Name.Contains(input))
                         select patient;
            GridView1.DataSource = query2.ToList();
            GridView1.DataBind();         
        }
    }
}
        