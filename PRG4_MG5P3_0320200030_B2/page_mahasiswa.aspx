<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="page_mahasiswa.aspx.cs" Inherits="PRG4_MG5P3_0320200030_B2.page_mahasiswa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section guestbook" id="mahasiswa">
        <div class="container">
            <!-- Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Mahasiswa</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div> 
            
            <div class="row" id="AddMahasiswa" runat="server">
                <div class="form-group">
                    <h1 class="mb-0">
                        <br />
                        <span class="text-center text-primary">Add Mahasiswa</span>
                        <br />
                    </h1>
                    <table>
                        <tr>
                            <td style="width: 50px">
                                NIM
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtNIM2" runat="server" CssClass="form-control" Width="100"></asp:TextBox>
                                <asp:Label ID="Label14" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="txtNIM2" runat="server"
                                    display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="False">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Prodi
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlProdi" runat="server" DataSourceID="srcProdi" DataTextField="NamaProdi" DataValueField="IDProdi" CssClass="dropdown-item" BackColor="LightGray"></asp:DropDownList>
                                <asp:SqlDataSource ID="srcProdi" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT * FROM [prodi]" ></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Nama Mahasiswa
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtNama2" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="valAddNamaProdi" ControlToValidate="txtNama2" runat="server"
                                    display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="False">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Tempat Lahir
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtTempat2" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label10" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtTempat2" runat="server" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Tanggal Lahir
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtTanggal2" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label11" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtTanggal2" runat="server" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Jenis Kelamin
                            </td>
                            <td style="margin-left: 50px">
                                <asp:RadioButton ID="Laki" runat="server" Text="Laki Laki" OnCheckedChanged="Laki_CheckedChanged" />
                                <asp:RadioButton ID="Perempuan" runat="server" Text="Perempuan" OnCheckedChanged="Perempuan_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Alamat
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtAlamat2" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label17" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="txtAlamat2" runat="server" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Email
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label13" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txtEmail2" runat="server" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Text="*Format Email" ControlToValidate="txtEmail"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="False"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Nomor HP
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtNoHP2" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label15" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="txtNoHP2" runat="server" Display="Dynamic" ForeColor="Red" Text="Nama Prodi Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Angkatan
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtAngkatan2" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label16" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="txtAngkatan2" runat="server" Display="Dynamic" ForeColor="Red" Text="Nama Prodi Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="btnSubmitAdd" runat="server" Text="Save" OnClick="btnSubmitAdd_Click" cssclass="btn btn-primary" ValidationGroup="valAdd" />
                    <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel"  OnClick="btnCancelAdd_Click" cssclass="btn btn-primary"/>
                </div>
            </div>
            
            <div class="row" id="SearchMahasiswa" runat="server">
                <div class="form-group">
                    <h1 class="mb-0">
                        <br />
                        <span class="text-center text-primary">Cari Mahasiswa</span>
                        <br />
                    </h1>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                    </br>
                    <asp:Button ID="btnSearch" runat="server" cssclass="btn btn-primary" OnClick="btnSearch_Click" Text="Cari" />
                    <br />
                </div>
            </div>
                
                <div class="row" id="ViewMahasiswa" runat="server">
                    <h1 class="mb-0">
                        <span class="text-center text-primary">View Mahasiswa</span>
                        <br />
                    </h1>
                    <asp:GridView runat="server" ID="gridDataMahasiswa" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"
                        AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="NIM" EmptyDataText="Tidak Ada Data" PageSize="5" PagerStyle-CssClas="pagination-ys"
                        ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridDataMahasiswa_PageIndexChanging" OnRowCommand="gridDataMahasiswa_RowCommand"
                        OnSorting="gridDataMahasiswa_Sorting" Width="250px" Font-Size="Small">
                        <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                        <Columns>
                            <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex +1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="NIM" HeaderText="NIM" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="NIM" />
                            <asp:BoundField DataField="idProdi" HeaderText="ID Prodi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="idProdi" />
                            <asp:BoundField DataField="namaMahasiswa" HeaderText="Nama Mahasiswa" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="namaMahasiswa" />
                            <asp:BoundField DataField="tempatLahir" HeaderText="Tempat Lahir" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="tempatLahir" />
                            <asp:BoundField DataField="tanggalLahir" HeaderText="Tanggal Lahir" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="tanggalLahir" />
                            <asp:BoundField DataField="jenisKelamin" HeaderText="Jenis Kelamin" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="jenisKelamin" />
                            <asp:BoundField DataField="Alamat" HeaderText="Alamat" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="alamat" />
                            <asp:BoundField DataField="Email" HeaderText="Email" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="email" />
                            <asp:BoundField DataField="NoHP" HeaderText="No HP" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nohp" />
                            <asp:BoundField DataField="Angkatan" HeaderText="Angkatan" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="angkatan" />
                            <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                        ToolTip="Ubah Data Table"><span class="fa fa-pencil-square-o" aria-hidden="true"></span></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                        ToolTip="Hapus Data Table"><span class="fa fa-trash-o" aria-hidden="true"></span></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:gridview>
                </div>
            
            <div class="row" id="EditMahasiswa" runat="server">
                <div class="form-group">
                    <h1 class="mb-0">
                        <br />
                        <span class="text-center text-primary">Edit Mahasiswa</span>
                        <br />
                        <br />
                    </h1>
                    <asp:Label id="lblId" Visible="false" runat="server"></asp:Label>
                    <table>
                        <tr>
                            <td style="width: 50px">
                                Prodi 
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlNamaProdi" runat="server" DataSourceID="srcProdi" DataTextField="NamaProdi" DataValueField="IDProdi" CssClass="dropdown-item" BackColor="LightGrey">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Nama Mahasiswa
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtNama" runat="server" CssClass="form-control" Width="100"></asp:TextBox>
                                <asp:Label ID="Label3" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtNama" runat="server"
                                    display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Tempat Lahir
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtTempat" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label4" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtTempat" runat="server" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Tanggal Lahir
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtTanggal" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label5" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtTanggal" runat="server" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Jenis Kelamin
                            </td>
                            <td>
                                <asp:RadioButton ID="LakiE" runat="server" Text="Laki Laki" OnCheckedChanged="Laki_CheckedChanged" />
                                <asp:RadioButton ID="PerempuanE" runat="server" Text="Perempuan" OnCheckedChanged="Perempuan_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Alamat
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtAlamat" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label6" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtAlamat" runat="server" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Email
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label7" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtEmail" runat="server" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Text="*Format Email" ControlToValidate="txtEmail"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="False"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Nomor HP
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtNoHP" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label8" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtNoHP" runat="server" Display="Dynamic" ForeColor="Red" Text="Nama Prodi Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50px">
                                Angkatan
                            </td>
                            <td>
                                </br>
                                <asp:TextBox ID="txtAngkatan" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="Label9" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtAngkatan" runat="server" Display="Dynamic" ForeColor="Red" Text="Nama Prodi Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    </br>
                    <asp:Button ID="btnSubmitEdit" runat="server" Text="Update" Onclick="btnSubmitEdit_Click" cssclass="btn btn-primary" ValidationGroup="valEdit" />
                    <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" Onclick="btnCancelEdit_Click" cssclass="btn btn-primary" />
                </div>
            </div>
        </div>
</section>
</asp:Content>
