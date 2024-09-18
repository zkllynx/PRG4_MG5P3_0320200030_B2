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
    public partial class page_prodi : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);
        DataSet ds = new DataSet();
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                EditProdi.Visible = false;
                AddProdi.Visible = true;
                ViewProdi.Visible = true;
            }
        }

        public DataSet loadData()
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "stp_getDataProdi";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@p1", txtSearch.Text);
            SqlDataAdapter adap = new SqlDataAdapter(com);
            adap.Fill(ds);
            gridDataProdi.DataSource = ds;
            gridDataProdi.DataBind();
            return ds;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {
            EditProdi.Visible = false;
            AddProdi.Visible = true;
            ViewProdi.Visible = false;
        }

        protected void btnSubmitEdit_onclick(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "stp_updateProdi";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@p1", lblId.Text);
            com.Parameters.AddWithValue("@p2", txtEditNamaProdi.Text);

            con.Open();
            com.ExecuteNonQuery();
            con.Close();

            loadData();
            clear();

            EditProdi.Visible = false;
            AddProdi.Visible = false;
            ViewProdi.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void gridDataProdi_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDataProdi.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void gridDataProdi_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Ubah")
            {
                String id = gridDataProdi.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                lblId.Text = id;
                txtEditNamaProdi.Text = gridDataProdi.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
                EditProdi.Visible = true;
                AddProdi.Visible = true;
                ViewProdi.Visible = true;
            }
            else if (e.CommandName == "Hapus")
            {
                String id = gridDataProdi.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                lblId.Text = id;
                Type cstype = this.GetType();

                // Get a ClientScriptManager reference from the Page class.
                ClientScriptManager cs = Page.ClientScript;

                // Check to see if the startup script is already registered.
                if (!cs.IsStartupScriptRegistered(cstype, "PopupScript"))
                {
                    SqlCommand com = new SqlCommand();
                    com.Connection = con;
                    com.CommandText = "stp_deleteProdi";
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@p1", lblId.Text);

                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();

                    loadData();
                    clear();

                    EditProdi.Visible = false;
                    AddProdi.Visible = true;
                    ViewProdi.Visible = true;
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void gridDataProdi_Sorting(object sender, GridViewSortEventArgs e)
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

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            EditProdi.Visible = false;
            AddProdi.Visible = true;
            ViewProdi.Visible = true;
            clear();
        }

        protected void btnSubmitAdd_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "stp_insertProdi";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@p1", txtAddNamaProdi.Text.ToUpper());
            con.Open();
            int result = Convert.ToInt32(com.ExecuteNonQuery());
            con.Close();
            loadData();
            clear();
            EditProdi.Visible = false;
            AddProdi.Visible = false;
            ViewProdi.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void btnCancelAdd_Click(object sender, EventArgs e)
        {
            EditProdi.Visible = false;
            AddProdi.Visible = false;
            ViewProdi.Visible = true;
            clear();
        }

        public void ShowAlertMessage(string pesan)
        {
            System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
            if (page != null)
            {
                pesan = pesan.Replace("'", "\'");
                System.Web.UI.ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + pesan + "'", true);
            }
        }

        public void clear()
        {
            txtAddNamaProdi.Text = "";
            txtEditNamaProdi.Text = "";
        }

        public void notif(int result)
        {
            if (result > 0)
            {
                ShowAlertMessage("Success, Berhasil Menyimpan Data");
                loadData();
                clear();
            }
            else
            {
                ShowAlertMessage("Failed, Contact Admin");
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

        private void SortGridView(string sortExpression, string direction)
        {
            DataTable dt = loadData().Tables[0];

            DataView dv = new DataView(dt);
            dv.Sort = sortExpression + direction;

            gridDataProdi.DataSource = dv;
            gridDataProdi.DataBind();
        }

        protected void btnSubmitEdit_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "stp_updateProdi";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@p1", lblId.Text);
            com.Parameters.AddWithValue("@p2", txtEditNamaProdi.Text);

            con.Open();
            com.ExecuteNonQuery();
            con.Close();

            loadData();
            clear();

            EditProdi.Visible = false;
            AddProdi.Visible = false;
            ViewProdi.Visible = true;
            Response.Redirect(Request.RawUrl);
        }
    }
}