#www.lasseclausen.com/lab/
#Use at your own risk
#Last-Modified: 12/01/2016
"""
Name-US:Rename all Instances
Description-US:Renames Instances accordingly to their Reference-Object. (SHIFT-CLICK: for adding ' Instance')
### Missing Links won't be affected ###
"""

import c4d
from c4d import gui

def GetAllObjects(doc):
    def SearchOM(op):
        if not op: return
        if op.GetDown(): return op.GetDown()
        while not op.GetNext() and op.GetUp():
            op = op.GetUp()
        return op.GetNext()

    obj=doc.GetFirstObject()
    liste=list()
    liste.append(obj)
    
    while obj:
        obj=SearchOM(obj)
        liste.append(obj)
        
    liste.remove(None)
    return liste

def main():
    
    bc=c4d.BaseContainer()
    doc=c4d.documents.GetActiveDocument()
    allobjects=GetAllObjects(doc)
    
    if len(allobjects)==0: return
    
    # If you press Shift the String ' Instance' will be added.

    doc.StartUndo()
    for x in GetAllObjects(doc):
        if x.GetType()==c4d.Oinstance and x[c4d.INSTANCEOBJECT_LINK]!=None:
            refname=x[c4d.INSTANCEOBJECT_LINK].GetName()
            doc.AddUndo(c4d.UNDOTYPE_CHANGE, x)
            x.SetName(refname)
            c4d.gui.GetInputState(c4d.BFM_INPUT_KEYBOARD, c4d.BFM_INPUT_CHANNEL, bc)
            if bc[c4d.BFM_INPUT_QUALIFIER]==1:
                x.SetName(refname+' Instance')    
    doc.EndUndo()
    c4d.EventAdd()

if __name__=='__main__':
    main()