package br.cefetrj.sisgee.view.convenio;

import br.cefetrj.sisgee.control.ConvenioServices;
import br.cefetrj.sisgee.model.entity.Convenio;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet para alterar convenio 
 * 
 */
@WebServlet(name = "AlteraConvenioServlet", urlPatterns = {"/AlteraConvenioServlet"})
public class AlteraConvenioServlet extends HttpServlet {
    
    /**
     * 
     * @param req um objeto HttpServletRequest que contém a solicitação feita pelo cliente do servlet.
     * @param resp um objeto HttpServletResponse que contém a resposta que o servlet envia para o cliente
     * @throws ServletException se o pedido do service não puder ser tratado
     * @throws IOException se um erro de entrada ou saída for detectado quando o servlet manipula o pedido 
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        int pos = req.getParameter("convenio").indexOf("/");
        //Substring iniciando em 0 até posição do caracter especial
        
        String numeroConvenio = req.getParameter("convenio").substring(0,pos);
        
        
        Convenio convenio = ConvenioServices.buscarConvenioByNumeroConvenio(numeroConvenio);
       
        
        if(convenio.getEmpresa()!=null){
            req.setAttribute("isEmpresa", "sim");
            if(convenio.getEmpresa().isAgenteIntegracao()){
                req.setAttribute("simAgenteIntegracao", "sim");
            }else{
                req.setAttribute("naoAgenteIntegracao", "sim");
            }
            req.setAttribute("cnpjEmpresa", convenio.getEmpresa().getCnpjEmpresa());
            req.setAttribute("nomeEmpresa", convenio.getEmpresa().getRazaoSocial());
            String dataRegistroEmpresa = null;
            dataRegistroEmpresa = new SimpleDateFormat("dd/MM/yyyy").format(convenio.getDataRegistro());
            req.setAttribute("dataRegistroConvenioEmpresa", dataRegistroEmpresa);
            req.setAttribute("emailEmpresa", convenio.getEmpresa().getEmailEmpresa());
            req.setAttribute("telefoneEmpresa", convenio.getEmpresa().getTelefoneEmpresa());
            req.setAttribute("contatoEmpresa", convenio.getEmpresa().getContatoEmpresa());
            req.setAttribute("numeroEmpresa", convenio.getNumero());
            req.setAttribute("anoEmpresa", convenio.getAno());
               
        }else{
            req.setAttribute("isPessoa", "sim");
            req.setAttribute("cpfPessoa", convenio.getPessoa().getCpf());
            req.setAttribute("nomePessoa", convenio.getPessoa().getNome());
            String dataRegistroPessoa = null;
            dataRegistroPessoa = new SimpleDateFormat("dd/MM/yyyy").format(convenio.getDataRegistro());
            req.setAttribute("dataRegistroConvenioPessoa", dataRegistroPessoa);
            req.setAttribute("emailPessoa", convenio.getPessoa().getEmail());
            req.setAttribute("telefonePessoa", convenio.getPessoa().getTelefone());
            req.setAttribute("numeroPessoa", convenio.getNumero());
            req.setAttribute("anoPessoa", convenio.getAno());
            
        }
        req.getSession().setAttribute("numero", numeroConvenio);
        
        req.setAttribute("convenioAlterar", convenio);
  
        req.getRequestDispatcher("form_alterar_convenio.jsp").forward(req, resp);
        
    }

}
