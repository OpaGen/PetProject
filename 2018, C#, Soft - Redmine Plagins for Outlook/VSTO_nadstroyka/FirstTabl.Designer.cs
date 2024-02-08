namespace VSTO_nadstroyka
{
    partial class Vigruzki : Microsoft.Office.Tools.Ribbon.RibbonBase
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        public Vigruzki()
            : base(Globals.Factory.GetRibbonFactory())
        {
            InitializeComponent();
        }

        /// <summary> 
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором компонентов

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.tab1 = this.Factory.CreateRibbonTab();
            this.group1 = this.Factory.CreateRibbonGroup();
            this.EasyTabl = this.Factory.CreateRibbonButton();
            this.menu1 = this.Factory.CreateRibbonMenu();
            this.nizkii = this.Factory.CreateRibbonCheckBox();
            this.normal = this.Factory.CreateRibbonCheckBox();
            this.visokii = this.Factory.CreateRibbonCheckBox();
            this.tab1.SuspendLayout();
            this.group1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tab1
            // 
            this.tab1.ControlId.ControlIdType = Microsoft.Office.Tools.Ribbon.RibbonControlIdType.Office;
            this.tab1.Groups.Add(this.group1);
            this.tab1.Label = "Отдел сопровождения";
            this.tab1.Name = "tab1";
            // 
            // group1
            // 
            this.group1.Items.Add(this.menu1);
            this.group1.Items.Add(this.EasyTabl);
            this.group1.Label = "Выгрузки";
            this.group1.Name = "group1";
            // 
            // EasyTabl
            // 
            this.EasyTabl.Image = global::VSTO_nadstroyka.Properties.Resources.AllDay_ru_28;
            this.EasyTabl.Label = "Вставка таблицы";
            this.EasyTabl.Name = "EasyTabl";
            this.EasyTabl.ShowImage = true;
            this.EasyTabl.Click += new Microsoft.Office.Tools.Ribbon.RibbonControlEventHandler(this.button1_Click);
            // 
            // menu1
            // 
            this.menu1.Description = "Низкий;Нормальный;Высокий;";
            this.menu1.Image = global::VSTO_nadstroyka.Properties.Resources.AllDay_ru_255;
            this.menu1.Items.Add(this.nizkii);
            this.menu1.Items.Add(this.normal);
            this.menu1.Items.Add(this.visokii);
            this.menu1.Label = "Приоритет";
            this.menu1.Name = "menu1";
            this.menu1.ShowImage = true;
            // 
            // nizkii
            // 
            this.nizkii.Checked = true;
            this.nizkii.Label = "Низкий";
            this.nizkii.Name = "nizkii";
            this.nizkii.Click += new Microsoft.Office.Tools.Ribbon.RibbonControlEventHandler(this.nizkii_Click);
            // 
            // normal
            // 
            this.normal.Label = "Нормальный";
            this.normal.Name = "normal";
            this.normal.Click += new Microsoft.Office.Tools.Ribbon.RibbonControlEventHandler(this.normal_Click);
            // 
            // visokii
            // 
            this.visokii.Label = "Высокий";
            this.visokii.Name = "visokii";
            this.visokii.Click += new Microsoft.Office.Tools.Ribbon.RibbonControlEventHandler(this.visokii_Click);
            // 
            // Vigruzki
            // 
            this.Name = "Vigruzki";
            this.RibbonType = "Microsoft.Outlook.Mail.Compose";
            this.Tabs.Add(this.tab1);
            this.Load += new Microsoft.Office.Tools.Ribbon.RibbonUIEventHandler(this.FirstTabl_Load);
            this.tab1.ResumeLayout(false);
            this.tab1.PerformLayout();
            this.group1.ResumeLayout(false);
            this.group1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        internal Microsoft.Office.Tools.Ribbon.RibbonTab tab1;
        internal Microsoft.Office.Tools.Ribbon.RibbonGroup group1;
        internal Microsoft.Office.Tools.Ribbon.RibbonButton EasyTabl;
        internal Microsoft.Office.Tools.Ribbon.RibbonCheckBox nizkii;
        internal Microsoft.Office.Tools.Ribbon.RibbonCheckBox normal;
        internal Microsoft.Office.Tools.Ribbon.RibbonCheckBox visokii;
        internal Microsoft.Office.Tools.Ribbon.RibbonMenu menu1;
    }

    partial class ThisRibbonCollection
    {
        internal Vigruzki FirstTabl
        {
            get { return this.GetRibbon<Vigruzki>(); }
        }
    }
}
