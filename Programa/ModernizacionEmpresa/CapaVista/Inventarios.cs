using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaControlador;

namespace CapaVista
{
    public partial class Inventarios : Form
    {
        string emp = "sic.productos";
        Controlador contr = new Controlador();
        public Inventarios()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Inventarios_Load(object sender, EventArgs e)
        {

        }
        public void actualizardatagriew()
        {
            DataTable dt = contr.llenarTbl(emp);
            dgvInventario.DataSource = dt;

        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            actualizardatagriew();
        }
    }
}
