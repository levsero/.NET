using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6.Pages
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        HospitalEntities2 he = new HospitalEntities2();
        protected void Page_Load(object sender, EventArgs e)
        {
            //get visits from database and display
            var query = from visits in he.visit
                        select visits;
            GridView1.DataSource = query.ToList();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var query = from visits in he.visit
                        select visits;

            List<visit> result = new List<visit>();

            //first check name
            foreach (visit v in query)
            {
                if (v.Patient.Name.Contains(NameBox.Text))
                {
                    result.Add(v);
                }
            }

            //filter by date of visit
            //further filter by year (if inputted)
            if (TextBox1.Text != "")
            {
                foreach (var v in result.ToList())
                {
                    if (v.DateOfVisit.Date.Year.ToString() != TextBox1.Text)
                    {
                        result.Remove(v);
                    }
                }
            }

            //further filter by day
            if (DayBox.Text != "")
            {
                foreach (var v in result.ToList())
                {if (v.DateOfVisit.Date.Day.ToString() != DayBox.Text)
                    {
                        result.Remove(v);
                    }
                }
            }

            //filter by month
            if (MonthBox.Text != "")
            {
                foreach (var v in result.ToList())
                {
                    if (v.DateOfVisit.Date.Month.ToString() != MonthBox.Text)
                    {
                        result.Remove(v);
                    }
                }
            }

            //filter by date of discharge
            //further filter by year (if inputted)
            if (YearBox2.Text != "")
            {
                foreach (var v in result.ToList())
                {
                    if (!v.DateOfDischarge.HasValue)
                    {
                        result.Remove(v);
                    }
                    else if (v.DateOfDischarge.GetValueOrDefault().Date.Year.ToString() != YearBox2.Text)
                    {
                        result.Remove(v);
                    }
                }
            }

            //further filter by day
            if (DayBox2.Text != "")
            {
                foreach (var v in result.ToList())
                {
                    if (!v.DateOfDischarge.HasValue)
                    {
                        result.Remove(v);
                    }
                    else if (v.DateOfDischarge.GetValueOrDefault().Date.Day.ToString() != DayBox2.Text)
                    {
                        result.Remove(v);
                    }
                }
            }

            //filter by month
            if (MonthBox2.Text != "")
            {
                foreach (var v in result.ToList())
                {
                    if (!v.DateOfDischarge.HasValue)
                    {
                        result.Remove(v);
                    }
                    else if (v.DateOfDischarge.GetValueOrDefault().Date.Month.ToString() != MonthBox2.Text)
                    {
                        result.Remove(v);
                    }
                }
            }
            GridView1.DataSource = result;
            GridView1.DataBind();
        }

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