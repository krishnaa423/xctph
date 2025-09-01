
#region modules
from xctph.xctph import Xctph
#endregion

#region variables
#endregion

#region functions
def main():
    xctph: Xctph = Xctph(nocc=5, nc=4, nv=4, nxct=5, npool=8)
    xctph.calc()
    xctph.write()
#endregion

#region classes
#endregion

#region main
main()
#endregion
