using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaVista
{
    public partial class ContenedorMDI : Form
    {
        private Ventas formaV;
        private Inventarios formaI;
        public ContenedorMDI()
        {
            InitializeComponent();
        }

        private void ventasToolStripMenuItem_Click(object sender, EventArgs e)
        {
           
        }
        void CerrarForma(object sender, FormClosedEventArgs e)
        {
            formaV = null;
            formaI = null;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void inventariosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void ventasToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            //Validacion para no abrir mas de una ventana del mismo form
            if (formaV == null)
            {
                formaV = new Ventas();
                formaV.MdiParent = this;
                formaV.FormClosed += new FormClosedEventHandler(CerrarForma);
                formaV.Show();
            }
            else
            {
                formaV.Activate();
            }
        }

        private void inventariosToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            //Validacion para no abrir mas de una ventana del mismo form
            if (formaV == null)
            {
                formaI = new Inventarios();
                formaI.MdiParent = this;
                formaI.FormClosed += new FormClosedEventHandler(CerrarForma);
                formaI.Show();
            }
            else
            {
                formaV.Activate();
            }
        }
    }
}
