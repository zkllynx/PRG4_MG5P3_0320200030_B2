<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="page_prodi.aspx.cs" Inherits="PRG4_MG5P3_0320200030_B2.page_prodi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section guestbook" id="prodi">
        <div class="container">
            <!-- GuestBook Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Prodi</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>          

            <div class="row" id="AddProdi" runat="server">
                <div class="form-group">
                    <h1 class="mb-0">
                <br />
                    <span class="text-center text-primary">Add Prodi</span>
                <br />
                </h1>
                    <label>Nama Prodi</label>
                    <asp:TextBox ID="txtAddNamaProdi" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="valAddNamaProdi" ControlToValidate="txtAddNamaProdi" runat="server"
                        display="Dynamic" ForeColor="Red" Text="Nama Prodi Wajib Diisi" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="False">
                    </asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel"  cssclass="btn btn-primary" OnClick="btnCancelAdd_Click"/>
                    <asp:Button ID="btnSubmitAdd" runat="server" Text="Save" cssclass="btn btn-primary" OnClick="btnSubmitAdd_Click" ValidationGroup="valAdd" />
                </div>
            </div>

            <h1 class="mb-0">
                <br />
                    <span class="text-center text-primary">Cari Prodi</span>
  
                <br />
                </h1>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" CssClass="form-check-label btn btn-primary" OnClick="btnSearch_Click" Text="Search" />
            <br />
            
            <div class="row" id="ViewProdi" runat="server">
              <h1 class="mb-0">
                <br />
                    <span class="text-center text-primary">View Prodi</span>
                <br />
                <asp:GridView runat="server" ID="gridDataProdi" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="idProdi" EmptyDataText="Tidak Ada Data" PageSize="5" PagerStyle-CssClas="pagination-ys"
                    ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridDataProdi_PageIndexChanging" OnRowCommand="gridDataProdi_RowCommand"
                   OnSorting="gridDataProdi_Sorting" Font-Size="Medium">
                <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                <Columns>
                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex +1 %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="namaProdi" HeaderText="Nama Prodi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="namaProdi" />
                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                ToolTip="Ubah Data Table"><span class="fa fa-pencil-square-o" aria-hidden="true"></span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                ToolTip="Hapus Data Table"><span class="fa fa-trash-o" aria-hidden="true" onclick="return confirm('Apakah Anda Ingin Menghapus data ?');"></span></asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
                </Columns>
                </asp:gridview>
                <br />
                </h1>
                </div>
            
            <div class="row" id="EditProdi" runat="server">
                <div class="form-group">
                    <h1 class="mb-0">
                <br />
                    <span class="text-center text-primary">Edit Prodian>
                <br />
                </h1>
                    <label>Nama Prodi</label> 
                    <asp:Label id="lblId" Visible="false" runat="server"></asp:Label>
                    <asp:TextBox ID="txtEditNamaProdi" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="Label3" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="valEditNamaProdi" ControlToValidate="txtEditNamaProdi" runat="server" 
                        Display="Dynamic" ForeColor="Red" Text="Nama Prodi Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False">
                    </asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" cssclass="btn btn-primary" Onclick="btnCancelEdit_Click"  />
                    <asp:Button ID="btnSubmitEdit" runat="server" Text="Update" cssclass="btn btn-primary" Onclick="btnSubmitEdit_Click" ValidationGroup="valEdit" />
                </div>
            </div>
        </div>
    </section>
    </span>
</asp:Content>
