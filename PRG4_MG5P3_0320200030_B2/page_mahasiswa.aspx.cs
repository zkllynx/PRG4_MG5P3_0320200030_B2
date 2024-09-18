using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRG4_MG5P3_0320200030_B2
{
    public partial class page_mahasiswa : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = "ASC";
        private const string DESCENDING = "DESC";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AddMahasiswa.Visible = true;
                SearchMahasiswa.Visible = true;
                ViewMahasiswa.Visible = true;
                EditMahasiswa.Visible = false;
            }
        }

        public DataSet loadData()
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "stp_getDataMahasiswa";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nama", txtSearch.Text);
            SqlDataAdapter adap = new SqlDataAdapter(com);
            adap.Fill(ds);
            gridDataMahasiswa.DataSource = ds;
            gridDataMahasiswa.DataBind();
            return ds;
        }

        public void clear()
        {
            txtNama.Text = "";
            txtNama2.Text = "";
        }

        public void notif(int result)
        {
            if (result > 0)
            {
                //ShowAlertMessage("Succes, Berhasil Menyimpan Data");
                loadData();
                clear();
            }
            else
            {
                //ShowAlertMessage("Failed, Contact Admin");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {

        }

        protected void gridDataMahasiswa_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDataMahasiswa.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void gridDataMahasiswa_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Ubah")
            {
                String id = gridDataMahasiswa.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                lblId.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
                AddMahasiswa.Visible = false;
                SearchMahasiswa.Visible = false;
                ViewMahasiswa.Visible = true;
                EditMahasiswa.Visible = true;
            }
            else if (e.CommandName == "Hapus")
            {
                String id = gridDataMahasiswa.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                lblId.Text = id;
                Type cstype = this.GetType();

                // Get a ClientScriptManager reference from the Page class.
                ClientScriptManager cs = Page.ClientScript;

                // Check to see if the startup script is already registered.
                if (!cs.IsStartupScriptRegistered(cstype, "PopupScript"))
                {
                    SqlCommand com = new SqlCommand();
                    com.Connection = con;
                    com.CommandText = "stp_deleteMahasiswa";
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@nim", lblId.Text);

                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();

                    loadData();
                    clear();

                    EditMahasiswa.Visible = false;
                    AddMahasiswa.Visible = false;
                    ViewMahasiswa.Visible = true;
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        public SortDirection GridViewSortDirection
        {
            get
            {
                if (ViewState["sortDirection"] == null)
                    ViewState["sortDirection"] = SortDirection.Ascending;
                return (SortDirection)ViewState["sortDirection"];
            }
            set { ViewState["sortDirection"] = value; }
        }

        public void SortGridView(string sortExpression, string direction)
        {
            DataTable dt = loadData().Tables[0];

            DataView dv = new DataView(dt);
            dv.Sort = sortExpression + direction;

            gridDataMahasiswa.DataSource = dv;
            gridDataMahasiswa.DataBind();
        }

        protected void gridDataMahasiswa_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;

            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                SortGridView(sortExpression, DESCENDING);
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                SortGridView(sortExpression, ASCENDING);
            }
        }

        protected void btnSubmitEdit_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "stp_updateMahasiswa";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nim", lblId.Text);
            com.Parameters.AddWithValue("@idprodi", ddlNamaProdi.SelectedValue);
            com.Parameters.AddWithValue("@nama", txtNama.Text);
            com.Parameters.AddWithValue("@tmptlahir", txtTempat.Text);
            com.Parameters.AddWithValue("@tgllahir", txtTanggal.Text);
            int a = 0;
            if (LakiE.Checked)
            {
                a = 1;
            }
            else
            {
                a = 0;
            }
            com.Parameters.AddWithValue("@jk", a);
            com.Parameters.AddWithValue("@alamat", txtAlamat.Text);
            com.Parameters.AddWithValue("@email", txtEmail.Text);
            com.Parameters.AddWithValue("@nohp", txtNoHP.Text);
            com.Parameters.AddWithValue("@angkatan", txtAngkatan.Text);

            con.Open();
            com.ExecuteNonQuery();
            con.Close();

            loadData();
            clear();

            AddMahasiswa.Visible = true;
            SearchMahasiswa.Visible = true;
            ViewMahasiswa.Visible = true;
            EditMahasiswa.Visible = false;
            Response.Redirect(Request.RawUrl);
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            AddMahasiswa.Visible = true;
            SearchMahasiswa.Visible = true;
            ViewMahasiswa.Visible = true;
            EditMahasiswa.Visible = false;
            clear();
        }

        protected void Laki_CheckedChanged(object sender, EventArgs e)
        {
            if (Laki.Checked)
            {
                Perempuan.Checked = false;
            }
        }

        protected void Perempuan_CheckedChanged(object sender, EventArgs e)
        {
            if (Perempuan.Checked)
            {
                Laki.Checked = false;
            }
        }

        protected void btnSubmitAdd_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "stp_insertMahasiswa";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nim", txtNIM2.Text);
            com.Parameters.AddWithValue("@idProdi", ddlProdi.SelectedValue);
            com.Parameters.AddWithValue("@nama", txtNama2.Text);
            com.Parameters.AddWithValue("@tmptlahir", txtTempat2.Text);
            com.Parameters.AddWithValue("@tgllahir", txtTanggal2.Text);
            int a = 0;
            if (Laki.Checked)
            {
                a = 1;
            }
            else
            {
                a = 0;
            }
            com.Parameters.AddWithValue("@jk", a);
            com.Parameters.AddWithValue("@alamat", txtAlamat2.Text);
            com.Parameters.AddWithValue("@email", txtEmail2.Text);
            com.Parameters.AddWithValue("@noHp", txtNoHP2.Text);
            com.Parameters.AddWithValue("@angkatan", txtAngkatan2.Text);

            con.Open();
            com.ExecuteNonQuery();
            con.Close();

            loadData();
            clear();

            AddMahasiswa.Visible = true;
            SearchMahasiswa.Visible = true;
            ViewMahasiswa.Visible = true;
            EditMahasiswa.Visible = false;
            Response.Redirect(Request.RawUrl);
        }

        protected void btnCancelAdd_Click(object sender, EventArgs e)
        {
            AddMahasiswa.Visible = true;
            SearchMahasiswa.Visible = true;
            ViewMahasiswa.Visible = true;
            EditMahasiswa.Visible = false;
            clear();
        }
    }
}