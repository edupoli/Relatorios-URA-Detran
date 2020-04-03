using Microsoft.Reporting.WebForms;
using System;

namespace Relatorios
{
    public partial class relAbandonadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGerarRelatorio_Click(object sender, EventArgs e)
        {
            if (TextInicial.Text == "")
            {
                ClientScript.RegisterStartupScript(GetType(), "randomtext", "datainicio();", true);
            }
            else if (TextFinal.Text == "")
            {
                ClientScript.RegisterStartupScript(GetType(), "randomtext", "datafim();", true);
            }
            else if (cboxUra.SelectedIndex == 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "randomtext", "sel_ura();", true);
            }
            else
            {
                string inicio = TextInicial.Text;
                string fim = TextFinal.Text;
                ReportParameterCollection reportParameters = new ReportParameterCollection();
                reportParameters.Add(new ReportParameter("p_dataInicial", inicio));
                reportParameters.Add(new ReportParameter("p_dataFinal", fim));
                reportParameters.Add(new ReportParameter("p_ura", cboxUra.SelectedValue));
                ReportViewer1.LocalReport.SetParameters(reportParameters);
                ReportViewer1.LocalReport.Refresh();
            }
        }
    }
}