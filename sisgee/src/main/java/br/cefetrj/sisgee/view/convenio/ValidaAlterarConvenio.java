package br.cefetrj.sisgee.view.convenio;

import br.cefetrj.sisgee.control.ConvenioServices;
import br.cefetrj.sisgee.model.entity.Convenio;
import br.cefetrj.sisgee.view.utils.ServletUtils;
import br.cefetrj.sisgee.view.utils.ValidaUtils;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet para validar dados do alterar convenio
 */

public class ValidaAlterarConvenio extends HttpServlet{

    private static final long serialVersionUID = 1L;

    /**
     * @param request um objeto HttpServletRequest que contém a solicitação feita pelo cliente do servlet.
     * @param response um objeto HttpServletResponse que contém a resposta que o servlet envia para o cliente
     * @throws ServletException se o pedido do service não puder ser tratado
     * @throws IOException se um erro de entrada ou saída for detectado quando o servlet manipula o pedido 
     */

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Locale locale = ServletUtils.getLocale(request);
        ResourceBundle messages = ResourceBundle.getBundle("Messages", locale);
        
        String tipoPessoa = request.getParameter("tipoPessoa");
        String cnpjEmpresa = request.getParameter("cnpjEmpresa");
        String nomeEmpresa = request.getParameter("nomeEmpresa");
        String agenteIntegracao = request.getParameter("agenteIntegracao");
        String emailEmpresa = request.getParameter("emailEmpresa");
        String telefoneEmpresa = request.getParameter("telefoneEmpresa");
        String contatoEmpresa = request.getParameter("contatoEmpresa");

        String dataAssinaturaConvenioEmpresa = request.getParameter("dataAssinaturaConvenioEmpresa");
        String dataAssinaturaConvenioPessoa = request.getParameter("dataAssinaturaConvenioPessoa");

        String cpfPessoa = request.getParameter("cpfPessoa");
        String nomePessoa = request.getParameter("nomePessoa");
        String emailPessoa = request.getParameter("emailPessoa");
        String telefonePessoa = request.getParameter("telefonePessoa");

        String numero = (String) request.getSession().getAttribute("numero");

        Convenio convenio = ConvenioServices.buscarConvenioByNumeroConvenio(numero);

        boolean isValid = true;
        Integer tamanho = 0;

        if(convenio.getEmpresa() != null){
            request.setAttribute("isEmpresa", tipoPessoa);
            /**
             * Validação do CNPJ da empresa usando os métodos da Classe
             * ValidaUtils Campo obrigatório; Tamanho de 14 caracteres;
             */
            String cnpjEmpresaMsg = "";
            tamanho = 14;
            cnpjEmpresaMsg = ValidaUtils.validaObrigatorio("cnpjEmpresa", cnpjEmpresa);
            if(cnpjEmpresaMsg.trim().isEmpty()){
                //remove caracteres especiais antes de fazer a validação numérica do CNPJ
                cnpjEmpresa = cnpjEmpresa.replaceAll("[.|/|-]", "");
                cnpjEmpresaMsg = ValidaUtils.validaInteger("cnpjEmpresa", cnpjEmpresa);
                if(cnpjEmpresaMsg.trim().isEmpty()){
                    cnpjEmpresaMsg = ValidaUtils.validaTamanhoExato("cnpjEmpresa", tamanho, cnpjEmpresa);
                    if(cnpjEmpresaMsg.trim().isEmpty()){
                        request.setAttribute("cnpjEmpresa", cnpjEmpresa);
                    }
                    else{
                        request.setAttribute("isEmpresa", "sim");
                        cnpjEmpresaMsg = messages.getString(cnpjEmpresaMsg);
                        cnpjEmpresaMsg = ServletUtils.mensagemFormatada(cnpjEmpresaMsg, locale, tamanho);
                        request.setAttribute("cnpjEmpresaMsg", cnpjEmpresaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    cnpjEmpresaMsg = messages.getString(cnpjEmpresaMsg);
                    request.setAttribute("cnpjEmpresaMsg", cnpjEmpresaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isEmpresa", "sim");
                cnpjEmpresaMsg = messages.getString(cnpjEmpresaMsg);
                request.setAttribute("cnpjEmpresaMsg", cnpjEmpresaMsg);
                isValid = false;
            }

            /**
             * Validação do campo Agente Integração, usando métodos da Classe
             * ValidaUtils. Deve ser campo booleano
             */

            String agenteIntegracaoMsg = "";
            agenteIntegracaoMsg = ValidaUtils.validaObrigatorio("agenteIntegracao", agenteIntegracao);
            if(agenteIntegracaoMsg.trim().isEmpty()){
                agenteIntegracaoMsg = ValidaUtils.validaBoolean("agenteIntegracao", agenteIntegracao);
                if(agenteIntegracaoMsg.trim().isEmpty()){
                    Boolean obrigatorio = Boolean.parseBoolean(agenteIntegracao);
                    request.setAttribute("obrigatorio", obrigatorio);
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    agenteIntegracaoMsg = messages.getString(agenteIntegracaoMsg);
                    request.setAttribute("agenteIntegracaoMsg", agenteIntegracaoMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isEmpresa", "sim");
                agenteIntegracaoMsg = messages.getString(agenteIntegracaoMsg);
                request.setAttribute("agenteIntegracaoMsg", agenteIntegracaoMsg);
                isValid = false;
            }

            /**
             * Validação da Razão Social do Cadastro Empresa usando métodos da
             * Classe ValidaUtils. Campo obrigatório; Tamanho máximo de 100 caracteres;
             */

            String nomeEmpresaMsg = "";
            nomeEmpresaMsg = ValidaUtils.validaObrigatorio("nomeEmpresa", nomeEmpresa);
            if(nomeEmpresaMsg.trim().isEmpty()){
                nomeEmpresaMsg = ValidaUtils.validaTamanho("nomeEmpresa", 100, nomeEmpresa);
                if(nomeEmpresaMsg.trim().isEmpty()){
                    request.setAttribute("nomeEmpresa", nomeEmpresa);
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    nomeEmpresaMsg = messages.getString(nomeEmpresaMsg);
                    nomeEmpresaMsg = ServletUtils.mensagemFormatada(nomeEmpresaMsg, locale, tamanho);
                    request.setAttribute("nomeEmpresaMsg", nomeEmpresaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isEmpresa", "sim");
                nomeEmpresaMsg = messages.getString(nomeEmpresaMsg);
                request.setAttribute("nomeEmpresaMsg", nomeEmpresaMsg);
                isValid = false;
            }

            /**
             * Validação do Email do Cadastro Empresa usando métodos da Classe
             * ValidaUtils. Campo obrigatório; Tamanho máximo de 50 caracteres;
             */

            String emailEmpresaMsg = "";
            emailEmpresaMsg = ValidaUtils.validaObrigatorio("emailEmpresa", emailEmpresa);
            if(emailEmpresaMsg.trim().isEmpty()){
                emailEmpresaMsg = ValidaUtils.validaTamanho("emailEmpresa", 50, emailEmpresa);
                if(emailEmpresaMsg.trim().isEmpty()){
                    emailEmpresaMsg = ValidaUtils.validaEmail("emailEmpresa", emailEmpresa);
                    if(emailEmpresaMsg.trim().isEmpty()){
                        request.setAttribute("emailEmpresa", emailEmpresa);
                    }
                    else{
                        request.setAttribute("isEmpresa", "sim");
                        emailEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("emailEmpresaMsg", emailEmpresaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    emailEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("emailEmpresaMsg", emailEmpresaMsg);
                    isValid = false;
                }
            }

            /**
             * Validação do Telefone do Cadastro Empresa usando métodos da
             * Classe ValidaUtils. Campo obrigatório; Tamanho máximo de 11
             * caracteres;
             */

            String telefoneEmpresaMsg = "";
            telefoneEmpresaMsg = ValidaUtils.validaObrigatorio("telefoneEmpresa", telefoneEmpresa);
            if(telefoneEmpresaMsg.trim().isEmpty()){
                telefoneEmpresaMsg = ValidaUtils.validaTamanho("telefoneEmpresa", 11, telefoneEmpresa);
                if(telefoneEmpresaMsg.trim().isEmpty()){
                    telefoneEmpresa = telefoneEmpresa.replaceAll("[.|/|-]", "");
                    telefoneEmpresaMsg = ValidaUtils.validaInteger("telefoneEmpresa", telefoneEmpresa);
                    if(telefoneEmpresaMsg.trim().isEmpty()){
                        telefoneEmpresaMsg = ValidaUtils.validaTelefone("telefoneEmpresa", telefoneEmpresa);
                        if(telefoneEmpresaMsg.trim().isEmpty()){
                            telefoneEmpresaMsg = ValidaUtils.validaNumeroDDD("telefoneEmpresa", telefoneEmpresa);
                            if(telefoneEmpresaMsg.trim().isEmpty()){
                                request.setAttribute("telefoneEmpresa", telefoneEmpresa);
                            }
                            else{
                                request.setAttribute("isEmpresa", "sim");
                                telefoneEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                                request.setAttribute("telefoneEmpresaMsg", telefoneEmpresaMsg);
                                isValid = false;
                            }
                        }
                        else{
                            request.setAttribute("isEmpresa", "sim");
                            telefoneEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                            request.setAttribute("telefoneEmpresaMsg", telefoneEmpresaMsg);
                            isValid = false;
                        }
                    }
                    else{
                        request.setAttribute("isEmpresa", "sim");
                        telefoneEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("telefoneEmpresaMsg", telefoneEmpresaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    telefoneEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("telefoneEmpresaMsg", telefoneEmpresaMsg);
                    isValid = false;
                }

            }

            /**
             * Validação do contato da Empresa usando metodos da classe
             * ValidaUtils. Campo opcional; Tamanho máximo de 50 caracteres;
             */

            String contatoEmpresaMsg = "";
            contatoEmpresaMsg = ValidaUtils.validaTamanho("contatoEmpresa", 50, contatoEmpresa);
            if(contatoEmpresaMsg.trim().isEmpty()){
                contatoEmpresaMsg = ValidaUtils.validaSomenteLetras("contatoEmpresa", contatoEmpresa);
                if(contatoEmpresaMsg.trim().isEmpty()){
                    request.setAttribute("contatoEmpresa", contatoEmpresa);
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    contatoEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("contatoEmpresaMsg", contatoEmpresaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isEmpresa", "sim");
                contatoEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                request.setAttribute("contatoEmpresaMsg", contatoEmpresaMsg);
                isValid = false;
            }

            /**
             * Validação da Data de Assinatura do Convenio da Empresa usando os
             * métodos da Classe ValidaUtils Campo obrigatório
             */

            Date dataAssinaturaEmpresa = null;
            String dataAssinaturaEmpresaMsg = "";
            String campo = "Data de Assinatura";
            dataAssinaturaEmpresaMsg = ValidaUtils.validaObrigatorio(campo, dataAssinaturaConvenioEmpresa);
            if(dataAssinaturaEmpresaMsg.trim().isEmpty()){
                dataAssinaturaEmpresaMsg = ValidaUtils.validaDate(campo, dataAssinaturaConvenioEmpresa);
                if(dataAssinaturaEmpresaMsg.trim().isEmpty()){
                    dataAssinaturaEmpresaMsg = ValidaUtils.validaTamanhoExato(campo, 10, dataAssinaturaConvenioEmpresa);
                    if(dataAssinaturaEmpresaMsg.trim().isEmpty()){
                        try {
                            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                            dataAssinaturaEmpresa = format.parse(dataAssinaturaConvenioEmpresa);
                            request.setAttribute("dataAssinaturaConvenioEmpresa", dataAssinaturaEmpresa);
                        } catch (Exception e) {
                            dataAssinaturaEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                            request.setAttribute("dataAssinaturaEmpresaMsg", dataAssinaturaEmpresaMsg);
                            isValid = false;
                            System.out.println(e.getMessage());
                        }
                    }
                    else{
                        request.setAttribute("isEmpresa", "sim");
                        dataAssinaturaEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("dataAssinaturaEmpresaMsg", dataAssinaturaEmpresaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    dataAssinaturaEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("dataAssinaturaEmpresaMsg", dataAssinaturaEmpresaMsg);
                    isValid = false;
                }
            }

        }
        else{

            /**
             * Validação do CPF da pessoa usando os métodos da Classe
             * ValidaUtils Campo obrigatório; Tamanho de 11 caracteres;
             */
            
            String cpfPessoaMsg = "";
            tamanho = 11;
            cpfPessoaMsg = ValidaUtils.validaObrigatorio("cpfPessoa", cpfPessoa);
            if(cpfPessoaMsg.trim().isEmpty()){
                //remove caracteres especiais antes de fazer a validação numérica do CPF
                cpfPessoa = cpfPessoa.replaceAll("[.|/|-]", "");
                cpfPessoaMsg = ValidaUtils.validaInteger("cpfPessoa", cpfPessoa);
                if(cpfPessoaMsg.trim().isEmpty()){
                    cpfPessoaMsg = ValidaUtils.validaTamanhoExato("cpfPessoa", tamanho, cpfPessoa);
                    if(cpfPessoaMsg.trim().isEmpty()){
                        request.setAttribute("cpfPessoa", cpfPessoa);
                    }
                    else{
                        request.setAttribute("isPessoa", "sim");
                        cpfPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("cpfPessoaMsg", cpfPessoaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isPessoa", "sim");
                    cpfPessoaMsg = messages.getString("br.cefetrj.sisgee.valida_utils.msg_valida_numerico");
                    request.setAttribute("cpfPessoaMsg", cpfPessoaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isPessoa", "sim");
                cpfPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                cpfPessoaMsg = ServletUtils.mensagemFormatada(cpfPessoaMsg, locale, tamanho);
                request.setAttribute("cpfPessoaMsg", cpfPessoaMsg);
                isValid = false;
            }

            /**
             * Validação do nome da Pessoa Fisica usando métodos
             * da Classe ValidaUtils. Campo obrigatorio; Tamanho máximo de 100
             * caracteres;
             */

            String nomePessoaMsg = "";
            nomePessoaMsg = ValidaUtils.validaObrigatorio("nomePessoa", nomePessoa);
            if (nomePessoaMsg.trim().isEmpty()) {
                nomePessoaMsg = ValidaUtils.validaTamanho("nomePessoa", 100, nomePessoa);
                if (nomePessoaMsg.trim().isEmpty()) {
                    nomePessoaMsg = ValidaUtils.validaSomenteLetras("nomePessoa", nomePessoa);
                    if (nomePessoaMsg.trim().isEmpty()) {
                        request.setAttribute("nomePessoa", nomePessoa);
                    }
                    else{
                        request.setAttribute("isPessoa", "sim");
                        nomePessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("nomePessoaMsg", nomePessoaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isPessoa", "sim");
                    nomePessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("nomePessoaMsg", nomePessoaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isPessoa", "sim");
                nomePessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                request.setAttribute("nomePessoaMsg", nomePessoaMsg);
                isValid = false;
            }

            /**
             * Validação do email da Pessoa Fisica usando
             * métodos da Classe ValidaUtils. Campo opcional; Tamanho máximo de
             * 50 caracteres;
             */

            String emailPessoaMsg = "";
            emailPessoaMsg = ValidaUtils.validaObrigatorio("emailPessoa", emailPessoa);
            if (emailPessoaMsg.trim().isEmpty()) {
                emailPessoaMsg = ValidaUtils.validaTamanho("emailPessoa", 50, emailPessoa);
                if (emailPessoaMsg.trim().isEmpty()) {
                    emailPessoaMsg = ValidaUtils.validaEmail("emailPessoa", emailPessoa);
                    if (emailPessoaMsg.trim().isEmpty()) {
                        request.setAttribute("emailPessoa", emailPessoa);
                    }
                    else{
                        request.setAttribute("isPessoa", "sim");
                        emailPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("emailPessoaMsg", emailPessoaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isPessoa", "sim");
                    emailPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("emailPessoaMsg", emailPessoaMsg);
                    isValid = false;
                }
            }

            /**
             * Validação do telefone da Pessoa Cadastro Pessoa Fisica usando
             * métodos da Classe ValidaUtils. Campo opcional; Tamanho máximo de
             * 11 caracteres;
             */

            String telefonePessoaMsg = "";
            telefonePessoaMsg = ValidaUtils.validaObrigatorio("telefonePessoa", telefonePessoa);
            if (telefonePessoaMsg.trim().isEmpty()) {
                telefonePessoaMsg = ValidaUtils.validaTamanho("telefonePessoa", 11, telefonePessoa);
                if (telefonePessoaMsg.trim().isEmpty()) {
                    telefonePessoa = telefonePessoa.replaceAll("[.|/|-]", "");
                    telefonePessoaMsg = ValidaUtils.validaInteger("telefonePessoa", telefonePessoa);
                    if (telefonePessoaMsg.trim().isEmpty()) {
                        telefonePessoaMsg = ValidaUtils.validaTelefone("telefonePessoa", telefonePessoa);
                        if (telefonePessoaMsg.trim().isEmpty()) {
                             request.setAttribute("telefonePessoa", telefonePessoa);
                         }
                         else{
                            request.setAttribute("isPessoa", "sim");
                            telefonePessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                            request.setAttribute("telefonePessoaMsg", telefonePessoaMsg);
                            isValid = false;
                         }
                     }
                     else{
                        request.setAttribute("isPessoa", "sim");
                        telefonePessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("telefonePessoaMsg", telefonePessoaMsg);
                        isValid = false;
                     }
                 }
                 else{
                    request.setAttribute("isPessoa", "sim");
                    telefonePessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("telefonePessoaMsg", telefonePessoaMsg);
                    isValid = false;
                 }
            }

            /**
             * Validação da Data de Assinatura do Convenio da Pessoa usando os
             * métodos da Classe ValidaUtils Campo obrigatório
             */

            Date dataAssinaturaPessoa = null;
            String dataAssinaturaPessoaMsg = "";
            String campo = "dataAssinaturaConvenioPessoa";
            dataAssinaturaPessoaMsg = ValidaUtils.validaObrigatorio(campo, dataAssinaturaConvenioPessoa);
            if (dataAssinaturaPessoaMsg.trim().isEmpty()) {
                dataAssinaturaPessoaMsg = ValidaUtils.validaDate(campo, dataAssinaturaConvenioPessoa);
                if (dataAssinaturaPessoaMsg.trim().isEmpty()) {
                    dataAssinaturaPessoaMsg = ValidaUtils.validaTamanhoExato(campo, 10, dataAssinaturaConvenioPessoa);
                    if (dataAssinaturaPessoaMsg.trim().isEmpty()) {
                        try {
                            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                            dataAssinaturaPessoa = format.parse(dataAssinaturaConvenioPessoa);
                            request.setAttribute("dataAssinaturaConvenioPessoa", dataAssinaturaPessoa);
                        } catch (Exception e) {
                            dataAssinaturaPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                            request.setAttribute("dataAssinaturaPessoaMsg", dataAssinaturaPessoaMsg);
                            isValid = false;
                            System.out.println(e.getMessage());
                        }
                    }
                    else{
                        request.setAttribute("isPessoa", "sim");
                        dataAssinaturaPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("dataAssinaturaPessoaMsg", dataAssinaturaPessoaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isPessoa", "sim");
                    dataAssinaturaPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("dataAssinaturaPessoaMsg", dataAssinaturaPessoaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isPessoa", "sim");
                dataAssinaturaPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                request.setAttribute("dataAssinaturaPessoaMsg", dataAssinaturaPessoaMsg);
                isValid = false;
            }

        }
        
        if(isValid){
            System.out.println("chegou");
            request.getRequestDispatcher("/SalvarAlteracaoConvenioServlet").forward(request, response);
        }
        else{
            System.out.println(convenio.getEmpresa().getTelefoneEmpresa());
            String msg = messages.getString("br.cefetrj.sisgee.valida_cadastro_empresa_servlet.msg_atencao");
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/form_alterar_convenio.jsp").forward(request, response);
        }


    }

}