using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AForge.Video.DirectShow;
using AForge.Video;

namespace CapaPresentacion
{
    public partial class frmcamaravigilancia : Form
    {
        //Defino los parametros de entrada para la cámara 
        private bool HayDispositivos;
        private FilterInfoCollection MiDispositivos; 
        private VideoCaptureDevice Miwebcam;
        public frmcamaravigilancia()
        {
            InitializeComponent();
        }

        private void frmcamaravigilancia_Load(object sender, EventArgs e)
        {
            Cargadispositivos();
        }

        //Metodo 'helper' para detectar los dispositivos que haya
        //Con distintos metodos se puede obtener tanto video como audio y demas gracias a la libreria AForge
        public void Cargadispositivos() {
            MiDispositivos = new FilterInfoCollection(FilterCategory.VideoInputDevice);

            if (MiDispositivos.Count > 0) {
                HayDispositivos = true;

                for (int i =0; i< MiDispositivos.Count; i++) {
                    cmbapagarencender.Items.Add(MiDispositivos[i].Name.ToString());
                    cmbapagarencender.Text = MiDispositivos[0].ToString();

                }
            }
            else {
                HayDispositivos = false;
            }
        }

        //Creacion de un void para detener la camara y que no siga ejecutando procesos
        public void CerrarWebcam()
        {
            if(Miwebcam != null && Miwebcam.IsRunning) { 
                Miwebcam.SignalToStop();
                Miwebcam = null;
            }
        }

        //Botón para encender la camara 
        private void btngrabar_Click(object sender, EventArgs e)
        {
            CerrarWebcam();
            int i = cmbapagarencender.SelectedIndex;
            String NombreVideo = MiDispositivos[i].MonikerString;
            Miwebcam = new VideoCaptureDevice(NombreVideo);
            Miwebcam.NewFrame += new NewFrameEventHandler(Capturando);
            Miwebcam.Start();
        }

        //metodo para ver el video y que vaya refrescandolo 
        private void Capturando(object sender, NewFrameEventArgs eventArgs)
        {
            Bitmap Imagen = (Bitmap)eventArgs.Frame.Clone();
            picboxcamaravigilancia.Image = Imagen;
        }

        //metodo externo para cerrar la camara y que no siga trabajando la memoria
        private void frmcamaravigilancia_FormClosed(object sender, FormClosedEventArgs e)
        {
            CerrarWebcam();
        }
    }
}
