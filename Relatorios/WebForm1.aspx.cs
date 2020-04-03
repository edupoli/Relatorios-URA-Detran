using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Relatorios
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            CalculaDiferencaDatas diferencaDatas = new CalculaDiferencaDatas(Convert.ToDateTime(txtinicial.Text),Convert.ToDateTime(txtfinal.Text));
            this.lblResultado.Text = "Diferença entre " + "\n" +
                this.txtinicial.Text + "\n" +
                " e \n" +
                this.txtfinal.Text +
                "\n" + " é : \n" +
                diferencaDatas.ToString();
        }
        public class CalculaDiferencaDatas
        {
            private int[] diasDoMes = new int[12] { 31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
            public DateTime datainicial;
            public DateTime dataFinal;
            public DateTime dataI;


            public CalculaDiferencaDatas(DateTime d1, DateTime d2)
            {
                int incremento;
                if (d1 > d2)
                {
                    this.datainicial = d2;
                    this.dataFinal = d1;
                }
                else
                {
                    this.datainicial = d1;
                    this.dataFinal = d2;
                }
                incremento = 0;
                if (this.datainicial.Day > this.dataFinal.Day)
                {
                    incremento = this.diasDoMes[this.datainicial.Month - 1];
                }
                if (incremento== -1)
                {
                    if (DateTime.IsLeapYear(this.datainicial.Year))
                    {
                        incremento = 29;
                    }
                    else
                    {
                        incremento = 28;
                    }
                }
                if (incremento != 0)
                {
                    Dias = (this.dataFinal.Day + incremento) - this.datainicial.Day;
                    incremento = 1;
                }
                else
                {
                    Dias = this.dataFinal.Day - this.datainicial.Day;
                }

                if ((this.datainicial.Month + incremento) > this.dataFinal.Month)
                {
                    this.Meses = (this.dataFinal.Month + 12) - (this.datainicial.Month + incremento);
                    incremento = 1;
                }
                else
	            {
                    this.Meses = (this.dataFinal.Month) - (this.datainicial.Month + incremento);
                    incremento = 0;
                }
                // calculo do ano
                this.Anos= dataFinal.Year - (datainicial.Year + incremento);
                while (this.datainicial.Day <= this.dataFinal.Day)
                {
                    


                }
            }
            public override string ToString()
            {
                return this.Anos + " Anos(s), " + this.Meses + " mes(es), " + this.Dias + " dia(s)";
            }
            public int Anos { get; }
            public int Meses { get; }
            public int Dias { get; }
            
        }
        
    }
}