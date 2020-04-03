<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="relChamadas2.aspx.cs" Inherits="Relatorios.relChamadas2" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" style="align-content:center">
        <br />
        <h3 style="text-align:center">Relatório de Chamadas na URA</h3>
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
            <LocalReport ReportPath="relChamadas2.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DSResolvidas" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DSAbandonadas" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DSTotalChamadas" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="DSSolucao" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource5" Name="DSMenu" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource6" Name="DSDetran0800" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource7" Name="DSAgendamento" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource8" Name="DSHabilitacao" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource9" Name="DSLicenciamento" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource10" Name="DSMultasRecursos" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource11" Name="DSMenuPrincipal" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource12" Name="DSProtocolo" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource13" Name="DSSolCPF" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource14" Name="DSVeiculos" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource14" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.VeiculosTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_Ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource13" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.Solicita_CPFTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_Ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource12" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.ProtocoloTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_Ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.Menu_PrincipalTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_Ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.Multas_e_RecursosTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_Ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.LicenciamentoTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_Ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.HabilitacaoTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_Ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.AgendamentoTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_Ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.Detran_0800TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_Ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.MenuTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataSolucao" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.DTSolucaoTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataTotaldeChamadas" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.DTTotaldeChamadasTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextInicial" Name="p_dataInicial" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="TextFinal" Name="p_dataFinal" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cboxUra" Name="p_ura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataAbandonadas" TypeName="Relatorios.bd_sercomtelccDataSetTableAdapters.DTAbandonadasTableAdapter">
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
        h3 {
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
