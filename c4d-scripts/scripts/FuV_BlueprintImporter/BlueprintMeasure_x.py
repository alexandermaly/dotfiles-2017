import c4d
from c4d import gui
#Welcome to the world of Python


def main():
    null01name = doc.SearchObject("measure 01 x")
    null02name = doc.SearchObject("measure 02 x")
    
    selection = doc.GetActiveObjects(c4d.GETACTIVEOBJECTFLAGS_0)
    
    
    if null01name == None or null02name == None:
        
        # Create measure NULLs
        null01 = c4d.BaseObject(c4d.Onull)
        null01[c4d.NULLOBJECT_DISPLAY]=13
        null01[c4d.NULLOBJECT_ORIENTATION]=3
        null01[c4d.ID_BASELIST_NAME] = "measure 01 x"
        null01[c4d.ID_BASEOBJECT_USECOLOR]=2
        null01[c4d.ID_BASEOBJECT_COLOR]=c4d.Vector(255,0,0)
        
        null02 = c4d.BaseObject(c4d.Onull)
        null02[c4d.NULLOBJECT_DISPLAY]=13
        null02[c4d.NULLOBJECT_ORIENTATION]=3
        null02[c4d.ID_BASELIST_NAME] = "measure 02 x"
        null02[c4d.ID_BASEOBJECT_USECOLOR]=2
        null02[c4d.ID_BASEOBJECT_COLOR]=c4d.Vector(255,0,0)
        null02[c4d.ID_BASEOBJECT_REL_POSITION,c4d.VECTOR_X]=50
        
        doc.StartUndo()
        
        # Insert NULL objects
        doc.AddUndo(c4d.UNDOTYPE_NEW,null01)
        doc.InsertObject(null01)
        doc.AddUndo(c4d.UNDOTYPE_NEW,null02)
        doc.InsertObject(null02)
        
        doc.EndUndo()
        
        # Unfold Hierarchy
        null02.InsertUnder(null01)
        null01.SetBit(c4d.BIT_ACTIVE)
        c4d.CallCommand(100004802) # Unfold Selected
        
        # Create protection tags
        pronull01 = null01.MakeTag(c4d.Tprotection)
        pronull01[c4d.PROTECTION_P_X]=False
        pronull01[c4d.PROTECTION_P_Y]=False
        
        pronull02 = null02.MakeTag(c4d.Tprotection)
        pronull02[c4d.PROTECTION_P_X]=False
        
    else:
        if len(selection) > 1:
            gui.MessageDialog("Select only the image plane.")
    
        elif len(selection) == 1:
            
            if op.GetType() ==  5168:
                
                doc.StartUndo()
                distance = float(null02name[c4d.ID_BASEOBJECT_REL_POSITION,c4d.VECTOR_X])
                distanceinput = float(c4d.gui.InputDialog("Set Distance").replace(',','.'))
                
                factor = distance/distanceinput
                width = op[c4d.PRIM_PLANE_WIDTH]

                height = op[c4d.PRIM_PLANE_HEIGHT]
                newwidth = width/factor
                newheight = height/factor
                
                doc.AddUndo(c4d.UNDOTYPE_CHANGE,op)
                op[c4d.PRIM_PLANE_HEIGHT] = newheight
                op[c4d.PRIM_PLANE_WIDTH] = newwidth
                
                doc.AddUndo(c4d.UNDOTYPE_CHANGE,null01name)
                null01name.SetAbsPos(null01name.GetAbsPos()/factor)
                null01name[c4d.NULLOBJECT_RADIUS] = null01name[c4d.NULLOBJECT_RADIUS]/factor
                
                doc.AddUndo(c4d.UNDOTYPE_CHANGE,null02name)
                null02name[c4d.ID_BASEOBJECT_REL_POSITION,c4d.VECTOR_X] = distance/factor
                null02name[c4d.NULLOBJECT_RADIUS] = null02name[c4d.NULLOBJECT_RADIUS]/factor
                
                doc.EndUndo()
                
                
            else:
                gui.MessageDialog("Select the image plane.")
        else:
            gui.MessageDialog("Select the image plane.")
    
    
    
    c4d.EventAdd()

if __name__=='__main__':
    main()
