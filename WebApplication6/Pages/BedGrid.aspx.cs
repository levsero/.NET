using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        HospitalEntities2 he = new HospitalEntities2();

        protected void Page_Load(object sender, EventArgs e)
        {
            //get beds from database and display
            GridView1.DataSource = he.Bed.ToList();
            GridView1.DataBind();
            var available = he.Bed.ToList();
            var query2 = from visits in he.visit
                         where (visits.PatientType == 0) &&
                               (visits.DateOfDischarge == null)
                         select visits.BedId;
            query2.ToList();
            foreach (var b in available.ToList())
            {
                if (query2.Contains(b.Id))
                {
                    available.Remove(b);
                }
            }

            GridView2.DataSource = available;
            GridView2.DataBind();
        }
    }
}