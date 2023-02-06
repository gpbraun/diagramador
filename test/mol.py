from rdkit import Chem
from rdkit.Chem.Draw import rdMolDraw2D
from rdkit.Chem import PandasTools

# PandasTools ~ rdDepictor
from rdkit import DataStructs
import re

pattern = re.compile("<\?xml.*\?>")


def DrawMol(mol, molSize=(450, 150), kekulize=True):
    mc = Chem.MolFromSmiles(mol)
    if kekulize:
        try:
            Chem.Kekulize(mc)
        except:
            mc = Chem.Mol(mol.ToBinary())
    if not mc.GetNumConformers():
        Chem.rdDepictor.Compute2DCoords(mc)

    drawer = rdMolDraw2D.MolDraw2DSVG(*molSize)
    drawer.DrawMolecule(mc)
    drawer.FinishDrawing()
    svg = drawer.GetDrawingText().replace("svg:", "")
    svg = re.sub(pattern, "", svg)
    return svg


print(DrawMol("CC1=COC2=C1C(=O)C(=O)C3=C2C=CC4=C3CCCC4(C)C"))
