<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Relatorios._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="font-size:30px">
        <p class="text-center" style="font-size:50px">Relatórios URA</p>
        
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Chamadas Abandonadas</h2>
            <p>
                Relatório descritivo de chamadas abandonadas na URA, com detalhamento de quantidade de ocorrências por Menu no período.
            </p>
            <p>
                <asp:Button ID="Button5" runat="server" CssClass="btn btn-default btn-sm" Text="Gerar Relatório &raquo;" PostBackUrl="~/relAbandonadas.aspx"/>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Chamadas Resolvidas</h2>
            <p>
                Relatório descritivo de chamadas Resolvidas na URA, com detalhamento de quantidade de ocorrências por Menu no período.
            </p>
            <p>
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-default btn-sm" Text="Gerar Relatório por Menu &raquo;" PostBackUrl="~/relResolvidas.aspx"/>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-default btn-sm" Text="Gerar Relatório por Data &raquo;" PostBackUrl="~/relResolvidasDiaria.aspx"/>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Total Chamadas URA</h2>
            <p>
                Relatório descritivo contendo o total geral de chamadas recebidas na URA, com detalhamento de quantidade de chamadas ocorridas em cada e ações em sub-menu.
            </p>
            <p>
                <asp:Button ID="Button3" runat="server" CssClass="btn btn-default btn-sm" Text="Gerar Relatório &raquo;" PostBackUrl="~/relChamadas2.aspx"/>
                <asp:Button ID="Button4" runat="server" CssClass="btn btn-default btn-sm" Text="Gerar Relatório Diário &raquo;" PostBackUrl="~/relChamadasDiaria.aspx"/>
            </p>
        </div>
    </div>
    <div class="row">
    <img src="~/Imagens/logo_recortado.jpg" alt="Sercomtel Contact Center" runat="server">
    </div>
    <style>
        img{
            position: absolute;
    bottom: 7%; 
    left: 82%;
    transform: translate(-50%, -50%); 
        }
        h1{
            font-size:20px
        }
    </style>
</asp:Content>
