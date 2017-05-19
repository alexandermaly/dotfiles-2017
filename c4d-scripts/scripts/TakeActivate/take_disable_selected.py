import c4d
from c4d import gui

#Author: s_bach
#TakeSystem Example


def main():
    takeData = doc.GetTakeData()
    if takeData is None:
        return

    mainTake = takeData.GetMainTake()

    selTakes = takeData.GetTakeSelection(1)
    childTake = mainTake.GetDown()
    print("starting")
    for t in selTakes:
        tn=t.GetName()
        print(tn)
        if tn.startswith(''):
            print(tn+" disabled")
            t.SetChecked(0)
            #print("deleting "+tn)
            #print(childTake)
            #print(takeData.DeleteTake(childTake))
            #print(childTake.DeleteOverride())
            #print(childTake.Reset())
            #print("gone")
            #childTake.setName("not used")

            #print(dir(t))
            #print(dir(mainTake))
            #print(dir(takeData))
    c4d.EventAdd()
if __name__=='__main__':
    main()
