import c4d
from c4d import gui

#Author: s_bach
#TakeSystem Example


def main():
    takeData = doc.GetTakeData()
    if takeData is None:
        return

    mainTake = takeData.GetMainTake()
    currTake = takeData.GetCurrentTake()
    c4d.StatusSetSpin()
    parent=currTake.GetUp()
    if parent is None:
        print("no parent takes, using Main as parent")
    else:
        childrenList=parent.GetChildren()
        for t in childrenList:
            print(tn+" enabled")
            t.SetChecked(1)
    c4d.StatusClear()
    c4d.EventAdd()

if __name__=='__main__':
    main()
