import c4d
from c4d import gui

def main():
    wc=c4d.GetWorldContainer()
    v1=wc[c4d.WPREF_UNITS_BASIC]
    if v1==10:
        print "app units are now in mm"
        wc[c4d.WPREF_UNITS_BASIC]=4 #mm
    else:
        wc[c4d.WPREF_UNITS_BASIC]=10 #inches
        print "app units are now in inches"
    v2=wc[c4d.WPREF_UNITS_BASIC]
    c4d.SetWorldContainer(wc)
    c4d.EventAdd()

    #wc2=c4d.GetWorldContainerInstance()
    #oldPasteAt = wc[c4d.WPREF_PASTEAT] # Get the current Paste setting
    #u1=wc[c4d.PREF_UNITS_BASIC] # get units pref

    #wc[c4d.PREF_UNITS_BASIC]=5

    #u2=wc[c4d.PREF_UNITS_BASIC] # get units pref

    #c4d.gui.UpdateMenus()
    #c4d.gui.GeUpdateUI()

    #print v1,v2#u1,u2#,v1,u2,v2
    #print wc[c4d.PREF_UNITS_BASIC]
    #print wc[c4d.WPREF_UNITS_BASIC]

if __name__=='__main__':
    main()
