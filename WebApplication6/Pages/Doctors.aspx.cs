using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class Doctors : System.Web.UI.Page
    {
        HospitalEntities2 he = new HospitalEntities2();

        protected void Page_Load(object sender, EventArgs e)
        {
            //get doctors from database and display
            var query = from doctor in he.Doctor
                        select doctor;            
            GridView1.DataSource = query.ToList();
            GridView1.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}