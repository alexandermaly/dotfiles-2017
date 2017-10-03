import c4d, os
from c4d import documents, bitmaps
def main():
    
    docpath = doc.GetDocumentPath()
    picture = c4d.storage.LoadDialog(type=c4d.FILESELECTTYPE_IMAGES, flags=c4d.FILESELECT_LOAD, def_path=docpath)
    
    #create a standard material
    mat = c4d.BaseMaterial(c4d.Mmaterial)
    
    doc.StartUndo()
    #insert the material in the document
    doc.InsertMaterial(mat)
    doc.AddUndo(c4d.UNDOTYPE_NEW, mat)
    
    imgname = os.path.splitext(os.path.basename(picture))[0]
    
    mat[c4d.MATERIAL_USE_REFLECTION] = 0
    mat.SetName(imgname)

    #create a bitmap shader
    xch = c4d.BaseList2D(c4d.Xbitmap)

    #set the path of the image file to the bitmap shader
    xch[c4d.BITMAPSHADER_FILENAME] = picture


    #set the shader to the color channel
    mat[c4d.MATERIAL_COLOR_SHADER] = xch
    
    #set the shader to the luminanz channel
    #mat[c4d.MATERIAL_LUMINANCE_SHADER] = xch   
    #mat[c4d.MATERIAL_USE_LUMINANCE]=True
    #mat[c4d.MATERIAL_USE_COLOR]=False
    
    mat.InsertShader(xch)

    filename = xch[c4d.BITMAPSHADER_FILENAME]
    bm = bitmaps.BaseBitmap()
    bm.InitWith(filename)
    getsize = bm.GetSize()
    xpix = float(getsize[0])
    ypix = float(getsize[1])

    #internal update of the material
    mat.Message(c4d.MSG_UPDATE)

    #recalculate the thumbnails of the material
    mat.Update(True, True)
    
    # Normalize width to 200px
    
    ypixnorm = float(xpix/ypix)

    # Create plane
    plane = c4d.BaseObject(c4d.Oplane)
    plane[c4d.PRIM_PLANE_WIDTH] = 200
    plane[c4d.PRIM_PLANE_HEIGHT] = 200/ypixnorm
    plane[c4d.PRIM_AXIS] = 5
    plane[c4d.ID_BASELIST_NAME] = imgname
    plane[c4d.PRIM_PLANE_SUBW] = 1
    plane[c4d.PRIM_PLANE_SUBH] = 1
    
    doc.InsertObject(plane)
    doc.AddUndo(c4d.UNDOTYPE_NEW, plane)
    doc.EndUndo()
     
    # Create texture tag
    tag = plane.MakeTag(c4d.Ttexture) 
    tag[c4d.TEXTURETAG_MATERIAL] = mat
    tag[c4d.TEXTURETAG_PROJECTION] = 6
    
    # Create display tag
    disptag = plane.MakeTag(c4d.Tdisplay) 
    disptag[c4d.DISPLAYTAG_AFFECT_DISPLAYMODE]=True
    
    # Set texture resolution
    maxres = int(max(ypix, xpix))
    
    print maxres
    
    if maxres > 1024 and maxres < 2048:
        mat[c4d.MATERIAL_PREVIEWSIZE] = 11
        
    elif maxres > 2048 and maxres < 4096:
        mat[c4d.MATERIAL_PREVIEWSIZE] = 12
        
    elif maxres > 4096 and maxres < 8192:
        mat[c4d.MATERIAL_PREVIEWSIZE] = 13
        
    elif maxres > 8192:
        mat[c4d.MATERIAL_PREVIEWSIZE] = 14
        
    else:
        mat[c4d.MATERIAL_PREVIEWSIZE] = 10
    
    c4d.EventAdd()

    

if __name__=='__main__':
    main()
