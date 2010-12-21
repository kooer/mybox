import _root_.scala.xml.parsing.FactoryAdapter
import _root_.scala.xml.factory.NodeFactory
import _root_.scala.xml.{Elem,MetaData,NamespaceBinding,Node,Text,TopScope}

trait NonBindingFactoryAdapter extends FactoryAdapter with NodeFactory[Elem] {
    def nodeContainsText(localName: String) = true

    protected def create(pre:String, label:String, attrs:MetaData, scpe:NamespaceBinding,children:Seq[Node]) :Elem = Elem(pre,label,attrs,scpe,children:_*)

    def createNode(pre:String, label:String, attrs:MetaData, scpe:NamespaceBinding,children:List[Node]) :Elem = Elem(pre,label,attrs,scpe,children:_*)

    def createText(text:String) = Text(text)

    def createProcInstr(target:String, data:String) = makeProcInstr(target,data)

}
