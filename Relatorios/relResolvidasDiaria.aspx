<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="relResolvidasDiaria.aspx.cs" Inherits="Relatorios.relResolvidaDiario" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" style="align-content:center">
        <br />
        <h2>Relatório Quantitativo de Chamadas Resolvidas na URA por Dia</h2>
        <br />
    <form>
        <div class="form-row col-md-12">
            <div class="form-group form-inline col-md-12">
                <asp:Label ID="Label1" runat="server" Text="&nbsp; Data Inicial &nbsp;"></asp:Label>
                <div class='input-group date' id='datetimepicker1'>
                    <asp:TextBox ID="TextInicial" runat="server" CssClass="form-control"></asp:TextBox>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                <asp:Label ID="Label2" runat="server" Text="Data Final &nbsp;"></asp:Label>
                <div class='input-group date' id='datetimepicker2'>
                    <asp:TextBox ID="TextFinal" runat="server" CssClass="form-control"></asp:TextBox>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                <asp:Label runat="server" for="ura">URA: &nbsp;</asp:Label>
                <asp:DropDownList runat="server" ID="cboxUra" CssClass="form-control">
                    <asp:ListItem>Selecione</asp:ListItem>
                    <asp:ListItem Value="0800 Detran">0800 Detran</asp:ListItem>
                    <asp:ListItem Value="PABX Detran">PABX Detran</asp:ListItem>
                </asp:DropDownList>
                <asp:Button Text="Gerar Relatório" runat="server" ID="btnGerarRelatorio" type="button" CssClass="btn btn-primary" OnClick="btnGerarRelatorio_Click" />
            </div>
    </form>
        </div>
        <div class="container" style="margin:auto 0px 0px auto; width:82%; height: 399px;align-content:center">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%">
                <LocalReport ReportPath="relResolvidasDiaria.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DSResolvidas" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DSResolvidasPorData" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.ResolvidoURA_diarioTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="cboxUra" Name="p_ura" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataResolvidas" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.DTResolvidasTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="cboxUra" Name="p_ura" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
    <script src="pt-br.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

    <style>
        h2 {
            text-align:center;
        }
    </style>
   <script>
        $(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY 00:00:00',
                locale: 'pt-br',
                showClear: true,
                showClose: true
            });
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY 23:59:59',
                locale: 'pt-br',
                showClear: true,
                showClose: true
            });
        });
    </script>    
    
    <script>
        function datainicio() {
            Swal.fire({
                type: 'error',
                title: 'Oops...',
                text: 'Informe uma data inicial para o relatório!'
            });
        };
     </script>
     <script>   
        function datafim() {
            Swal.fire({
                type: 'error',
                title: 'Oops...',
                text: 'Informe uma data fim para o relatório!'
            });
        };
      </script>
    <script>
       function sel_ura() {
           Swal.fire({
               type: 'error',
               title: 'Oops...',
               text: 'Selecione a URA!'
           });
        };
    </script>
</asp:Content>
