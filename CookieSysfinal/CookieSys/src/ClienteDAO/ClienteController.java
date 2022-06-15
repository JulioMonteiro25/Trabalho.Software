package ClienteDAO;
import Conexao.Conexao;
import Dados.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;



public class ClienteController {
    ArrayList<Cliente> Lista = new ArrayList<>();
    
    public void AdicionarCliente(Cliente cliente) throws SQLException{
	Connection con = Conexao.getConnection();
	PreparedStatement pstm = null;
	try{
            String sql = "insert into Cliente(nome,Documento,Contato,Endereco,Flag) values(?,?,?,?,?);";
            pstm = con.prepareStatement(sql);
            pstm.setString(1,cliente.getNome());
            pstm.setString(2,cliente.getDocumento());
                if(cliente.getDocumento().length() == 14){
                    pstm.setString(5,"PF");
                }else if(cliente.getDocumento().length() ==18){
                    pstm.setString(5,"PJ");
                } 
            pstm.setString(3,cliente.getContato());
            pstm.setString(4,cliente.getEndereco());
            pstm.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Cliente cadastrado com sucesso!!");
        }catch (SQLException ErroSql){
            JOptionPane.showMessageDialog(null, "Erro"+ErroSql, "pessoa", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void EditarCliente(Cliente cliente) throws SQLException{
	Connection con = Conexao.getConnection();
	PreparedStatement pstm = null;
	try{
            String sql = "UPDATE Cliente SET Nome = ?,Documento = ?,Contato = ?, Endereco = ? WHERE idCliente = ?";
            pstm = con.prepareStatement(sql);
            pstm.setString(1,cliente.getNome());
            pstm.setString(2,cliente.getDocumento());
            pstm.setString(3,cliente.getContato());
            pstm.setString(4,cliente.getEndereco());
            pstm.setInt(5,cliente.getId());
            pstm.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Cliente alterado com sucesso!!");
	}catch (SQLException ErroSql){
            JOptionPane.showMessageDialog(null, "Erro"+ErroSql, "pessoa", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void ExcluirCliente(Cliente cliente) throws SQLException{
	Connection con = Conexao.getConnection();
	PreparedStatement pstm = null;
	try{
            String sql = "DELETE from Cliente WHERE idCliente = ?";
            pstm = con.prepareStatement(sql);
            pstm.setInt(1,cliente.getId());    
            pstm.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Cliente excluido com sucesso!!");
	}catch (SQLException ErroSql){
            JOptionPane.showMessageDialog(null, "Erro"+ErroSql, "pessoa", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public ArrayList<Cliente> ListarCliente() {
        
        ResultSet rs;
        
        String sql = "select * from Cliente";
        Connection con = new Conexao().getConnection();
        PreparedStatement pstm = null;

        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getInt("IdCliente"));
                c.setNome(rs.getString("Nome"));
                c.setDocumento(rs.getString("Documento"));
                c.setContato(rs.getString("Contato"));
                c.setEndereco(rs.getString("Endereco"));
                c.setFlag(rs.getString("Flag"));
                Lista.add(c);
            }
        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(null, "Cliente: " + erro);
        }
        return Lista;
    }

}