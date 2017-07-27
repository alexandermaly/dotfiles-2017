// C4D-DialogResource
DIALOG IDD_DIALOG1
{
  NAME IDS_DIALOG; SCALE_V; SCALE_H; 
  
  TAB IDC_GRP_TABS
  {
    SCALE_V; SCALE_H; 
    SELECTION_TABS; 
    
    GROUP IDC_GRP_DOMELIGHTS
    {
      NAME IDS_GRP_DOMELIGHTS; ALIGN_TOP; SCALE_H; 
      BORDERSTYLE BORDER_NONE; BORDERSIZE 4, 4, 4, 8; 
      COLUMNS 1;
      
      GROUP IDC_GRP_TEXPATH
      {
        NAME IDS_GRP_TEXTPATH; ALIGN_TOP; SCALE_H; 
        BORDERSIZE 0, 0, 0, 0; 
        COLUMNS 2;
        SPACE 4, 4;
        
        STATICTEXT IDC_LBL_TEXPATH { NAME IDS_LBL_TEXPATH; CENTER_V; ALIGN_LEFT; }
        STATICTEXT IDC_ST_TEXPATH { NAME IDS_ST_TEXPATH; CENTER_V; SCALE_H; BORDERSTYLE BORDER_THIN_IN; }
      }
      GROUP IDC_GRP_EXPADJ
      {
        NAME IDS_GRP_EXPADJ; ALIGN_TOP; SCALE_H; 
        BORDERSIZE 0, 0, 0, 0; 
        COLUMNS 2;
        SPACE 4, 4;
        
        STATICTEXT IDC_LBL_EXPOSURE { NAME IDS_LBL_EXPOSURE; CENTER_V; ALIGN_LEFT; }
        EDITSLIDER IDC_EDIT_EXPOSURE
        { CENTER_V; SCALE_H; SIZE 70, 0; }
      }
      GROUP IDC_GRP_TEXRES
      {
        NAME IDS_GRP_TEXRES; ALIGN_TOP; SCALE_H; 
        BORDERSIZE 0, 0, 0, 0; 
        COLUMNS 2;
        SPACE 4, 4;
        
        STATICTEXT IDC_LBL_TEXRES { NAME IDS_LBL_TEXRES; CENTER_V; ALIGN_LEFT; }
        COMBOBOX IDC_CBX_MATRES
        {
          CENTER_V; SCALE_H; 
          CHILDS
          {
            0, IDS_MATRES_DEF; 
            1, IDS_MATRES_NO_SCALE; 
            6, IDS_MATRES_64; 
            7, IDS_MATRES_128; 
            8, IDS_MATRES_256; 
            9, IDS_MATRES_512; 
            10, IDS_MATRES_1024; 
            11, IDS_MATRES_2048; 
            12, IDS_MATRES_4096; 
            13, IDS_MATRES_8192; 
            14, IDS_MATRES_16384; 
          }
        }
      }
      SEPARATOR { SCALE_H; }
      GROUP IDC_GRP_BUTTON
      {
        NAME IDS_GRP_BUTTON; ALIGN_TOP; CENTER_H; 
        BORDERSTYLE BORDER_NONE; BORDERSIZE 0, 5, 0, 0; 
        COLUMNS 2;
        SPACE 4, 4;
        
        BUTTON IDC_BTN_VIEWTEX { NAME IDS_BTN_VIEWTEX; ALIGN_TOP; CENTER_H; SIZE 0, 16; }
        BUTTON IDC_BTN_CLEARTEX { NAME IDS_BTN_CLEARTEX; ALIGN_TOP; CENTER_H; SIZE 0, 16; }
      }
    }
    GROUP IDC_GRP_BGENV
    {
      NAME IDS_GRP_BGENV; CENTER_V; SCALE_H; 
      BORDERSTYLE BORDER_NONE; BORDERSIZE 4, 4, 4, 8; 
      COLUMNS 1;
      
      GROUP IDC_GRP_BE_TEXPATH
      {
        NAME IDS_GRP_BE_TEXPATH; ALIGN_TOP; SCALE_H; 
        BORDERSIZE 0, 0, 0, 0; 
        COLUMNS 2;
        SPACE 4, 4;
        
        STATICTEXT IDC_LBL_BE_TEXPATH { NAME IDS_LBL_BE_TEXPATH; CENTER_V; ALIGN_LEFT; }
        STATICTEXT IDC_ST_BE_TEXPATH { NAME IDS_ST_BE_TEXPATH; CENTER_V; SCALE_H; BORDERSTYLE BORDER_THIN_IN; }
      }
      GROUP IDC_GRP_BE_EXPADJ
      {
        NAME IDS_GRP_BE_EXPADJ; ALIGN_TOP; SCALE_H; 
        BORDERSIZE 0, 0, 0, 0; 
        COLUMNS 2;
        SPACE 4, 4;
        
        STATICTEXT IDC_LBL_BE_EXPOSURE { NAME IDS_LBL_BE_EXPOSURE; CENTER_V; ALIGN_LEFT; }
        EDITSLIDER IDC_EDIT_BE_EXPOSURE
        { CENTER_V; SCALE_H; SIZE 70, 0; }
      }
      GROUP IDC_GRP_BE_TEXRES
      {
        NAME IDS_GRP_BE_TEXRES; ALIGN_TOP; SCALE_H; 
        BORDERSIZE 0, 0, 0, 0; 
        COLUMNS 2;
        SPACE 4, 4;
        
        STATICTEXT IDC_LBL_BE_TEXRES { NAME IDS_LBL_BE_TEXRES; CENTER_V; ALIGN_LEFT; }
        COMBOBOX IDC_CBX_BE_MATRES
        {
          CENTER_V; SCALE_H; 
          CHILDS
          {
            0, IDS_MATRES_DEF; 
            1, IDS_MATRES_NO_SCALE; 
            6, IDS_MATRES_64; 
            7, IDS_MATRES_128; 
            8, IDS_MATRES_256; 
            9, IDS_MATRES_512; 
            10, IDS_MATRES_1024; 
            11, IDS_MATRES_2048; 
            12, IDS_MATRES_4096; 
            13, IDS_MATRES_8192; 
            14, IDS_MATRES_16384; 
          }
        }
      }
      SEPARATOR { SCALE_H; }
      GROUP IDC_GRP_BE_BUTTON
      {
        NAME IDS_GRP_BE_BUTTON; ALIGN_TOP; CENTER_H; 
        BORDERSTYLE BORDER_NONE; BORDERSIZE 0, 5, 0, 0; 
        COLUMNS 2;
        SPACE 4, 4;
        
        BUTTON IDC_BTN_BE_VIEWTEX { NAME IDS_BTN_BE_VIEWTEX; ALIGN_TOP; CENTER_H; SIZE 0, 16; }
        BUTTON IDC_BTN_BE_CLEARTEX { NAME IDS_BTN_BE_CLEARTEX; ALIGN_TOP; CENTER_H; SIZE 0, 16; }
      }
    }
  }
}