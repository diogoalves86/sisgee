package br.cefetrj.sisgee.view.convenio;

import br.cefetrj.sisgee.control.ConvenioServices;
import br.cefetrj.sisgee.model.entity.Convenio;
import br.cefetrj.sisgee.view.utils.ServletUtils;
import java.io.IOException;
import java.util.Date;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
/**
 * Servlet para salvar dados alterados do convenio
 *
 */
public class SalvarAlteracaoConvenioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * 
     * @param request um objeto HttpServletRequest que contém a solicitação feita pelo cliente do servlet.
     * @param response um objeto HttpServletResponse que contém a resposta que o servlet envia para o cliente
     * @throws ServletException se o pedido do service não puder ser tratado
     * @throws IOException se um erro de entrada ou saída for detectado quando o servlet manipula o pedido 
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Locale locale = ServletUtils.getLocale(request);
        ResourceBundle messages = ResourceBundle.getBundle("Messages", locale);

        String numero = (String) request.getSession().getAttribute("numero");

        String cpfPessoa = request.getParameter("cpfPessoa");
        String nomePessoa = request.getParameter("nomePessoa");
        String emailPessoa = request.getParameter("emailPessoa");
        String telefonePessoa = request.getParameter("telefonePessoa");

        Date dataRegistroConvenioEmpresa = (Date) request.getAttribute("dataRegistroConvenioEmpresa");
        Date dataRegistroConvenioPessoa = (Date) request.getAttribute("dataRegistroConvenioPessoa");
        
        String agenteIntegracao = request.getParameter("agenteIntegracao");
        String cnpjEmpresa = request.getParameter("cnpjEmpresa");
        String nomeEmpresa = request.getParameter("nomeEmpresa");
        String emailEmpresa = request.getParameter("emailEmpresa");
        String telefoneEmpresa = request.getParameter("telefoneEmpresa");
        String contatoEmpresa = request.getParameter("contatoEmpresa");

        Boolean ehAgente = Boolean.parseBoolean(agenteIntegracao);

        Convenio convenio = ConvenioServices.buscarConvenioByNumeroConvenio(numero);
        if(convenio.getEmpresa() != null){
            cnpjEmpresa = cnpjEmpresa.replaceAll("[.|/|-]", "");
            telefoneEmpresa = telefoneEmpresa.replaceAll("[.|/|-]", "");
            convenio.getEmpresa().setAgenteIntegracao(ehAgente);
            convenio.getEmpresa().setCnpjEmpresa(cnpjEmpresa);
            convenio.getEmpresa().setRazaoSocial(nomeEmpresa);
            convenio.getEmpresa().setContatoEmpresa(contatoEmpresa);
            convenio.getEmpresa().setTelefoneEmpresa(telefoneEmpresa);
            convenio.getEmpresa().setEmailEmpresa(emailEmpresa);
            convenio.setDataRegistro(dataRegistroConvenioEmpresa);

            convenio.setNumeroConvenio();
        }
        else{
            cpfPessoa = cpfPessoa.replaceAll("[.|/|-]", "");
            telefonePessoa = telefonePessoa.replaceAll("[.|/|-]", "");
            convenio.getPessoa().setCpf(cpfPessoa);
            convenio.getPessoa().setNome(nomePessoa);
            convenio.getPessoa().setTelefone(telefonePessoa);
            convenio.getPessoa().setEmail(emailPessoa);
            convenio.setDataRegistro(dataRegistroConvenioPessoa);

            convenio.setNumeroConvenio();
        }

        String msg = "";
        Logger lg = Logger.getLogger(SalvarAlteracaoConvenioServlet.class);

        try{
            ConvenioServices.alterarConvenio(convenio);
            msg = messages.getString("br.cefetrj.sisgee.incluir_cadastro_empresa_servlet.msg_convenio_cadastrado");
            request.setAttribute("msg", msg);
            request.setAttribute("numeroConvenioGerado", convenio.getNumeroConvenio());
            request.getRequestDispatcher("/form_empresa_sucesso.jsp").forward(request, response);
        }
        catch (Exception e){
            msg = messages.getString("br.cefetrj.sisgee.incluir_cadastro_empresa_servlet.msg_ocorreu_erro");
            request.setAttribute("msg", msg);
            lg.error("Exception ao tentar alterar um convenio", e);
            request.getRequestDispatcher("/form_renovar_convenio.jsp").forward(request, response);
            lg.info(msg);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}