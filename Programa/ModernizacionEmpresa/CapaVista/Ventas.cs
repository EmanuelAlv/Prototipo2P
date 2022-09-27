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
    public partial class Ventas : Form
    {
        string emp = "sic.ventas_encabezado";
        Controlador contr = new Controlador();
        public Ventas()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
        public void actualizardatagriew()
        {
            DataTable dt = contr.llenarTbl(emp);
            dgvVentas.DataSource = dt;

        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            actualizardatagriew();
        }

        private void Ventas_Load(object sender, EventArgs e)
        {

        }
    }
}
