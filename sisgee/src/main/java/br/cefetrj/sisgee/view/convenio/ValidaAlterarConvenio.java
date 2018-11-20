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
        String numeroEmpresa = request.getParameter("numeroEmpresa");
        String anoEmpresa = request.getParameter("anoEmpresa");

        String dataRegistroConvenioEmpresa = request.getParameter("dataRegistroConvenioEmpresa");
        String dataRegistroConvenioPessoa = request.getParameter("dataRegistroConvenioPessoa");

        String cpfPessoa = request.getParameter("cpfPessoa");
        String nomePessoa = request.getParameter("nomePessoa");
        String emailPessoa = request.getParameter("emailPessoa");
        String telefonePessoa = request.getParameter("telefonePessoa");
        String numeroPessoa = request.getParameter("numeroPessoa");

        String anoPessoa = request.getParameter("anoPessoa");

        String numero = (String) request.getSession().getAttribute("numero");

        Convenio convenio = ConvenioServices.buscarConvenioByNumeroConvenio(numero);

        boolean isValid = true;
        if(convenio.getEmpresa() != null){
            request.setAttribute("isEmpresa", tipoPessoa);

            /**
             * Validação do CNPJ da empresa usando os métodos da Classe
             * ValidaUtils Campo obrigatório; Tamanho de 14 caracteres;
             */
            String cnpjEmpresaMsg = "";
            cnpjEmpresaMsg = ValidaUtils.validaObrigatorio("cnpjEmpresa", cnpjEmpresa);
            if(cnpjEmpresaMsg.trim().isEmpty()){
                //remove caracteres especiais antes de fazer a validação numérica do CNPJ
                cnpjEmpresa = cnpjEmpresa.replaceAll("[.|/|-]", "");
                cnpjEmpresaMsg = ValidaUtils.validaInteger("cnpjEmpresa", cnpjEmpresa);
                if(cnpjEmpresaMsg.trim().isEmpty()){
                    cnpjEmpresaMsg = ValidaUtils.validaTamanhoExato("cnpjEmpresa", 14, cnpjEmpresa);
                    if(cnpjEmpresaMsg.trim().isEmpty()){
                        request.setAttribute("cnpjEmpresa", cnpjEmpresa);
                    }
                    else{
                        request.setAttribute("isEmpresa", "sim");
                        cnpjEmpresaMsg = messages.getString(cnpjEmpresaMsg);
                        cnpjEmpresaMsg = ServletUtils.mensagemFormatada(cnpjEmpresaMsg, locale, 14);
                        request.setAttribute("cnpjEmpresa", cnpjEmpresa);
                        request.setAttribute("cnpjEmpresaMsg", cnpjEmpresaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    cnpjEmpresaMsg = messages.getString(cnpjEmpresaMsg);
                    request.setAttribute("cnpjEmpresa", cnpjEmpresa);
                    request.setAttribute("cnpjEmpresaMsg", cnpjEmpresaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isEmpresa", "sim");
                cnpjEmpresaMsg = messages.getString(cnpjEmpresaMsg);
                request.setAttribute("cnpjEmpresa", cnpjEmpresa);
                request.setAttribute("cnpjEmpresaMsg", cnpjEmpresaMsg);
                isValid = false;
            }

            /**
             * Validação do campo Agente Integração, usando métodos da Classe
             * ValidaUtils. Deve ser campo booleano
             */

            String agenteIntegracaoMsg = "";
            Boolean obrigatorio = true;
            agenteIntegracaoMsg = ValidaUtils.validaObrigatorio("agenteIntegracao", agenteIntegracao);
            if(agenteIntegracaoMsg.trim().isEmpty()){
                agenteIntegracaoMsg = ValidaUtils.validaBoolean("agenteIntegracao", agenteIntegracao);
                if(agenteIntegracaoMsg.trim().isEmpty()){
                    obrigatorio = Boolean.parseBoolean(agenteIntegracao);
                    request.setAttribute("obrigatorio", obrigatorio);
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    agenteIntegracaoMsg = messages.getString(agenteIntegracaoMsg);
                    request.setAttribute("obrigatorio", obrigatorio);
                    request.setAttribute("agenteIntegracaoMsg", agenteIntegracaoMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isEmpresa", "sim");
                agenteIntegracaoMsg = messages.getString(agenteIntegracaoMsg);
                request.setAttribute("obrigatorio", obrigatorio);
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
                    nomeEmpresaMsg = ServletUtils.mensagemFormatada(nomeEmpresaMsg, locale, 100);
                    request.setAttribute("nomeEmpresa", nomeEmpresa);
                    request.setAttribute("nomeEmpresaMsg", nomeEmpresaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isEmpresa", "sim");
                nomeEmpresaMsg = messages.getString(nomeEmpresaMsg);
                request.setAttribute("nomeEmpresa", nomeEmpresa);
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
                        request.setAttribute("emailEmpresa", emailEmpresa);
                        request.setAttribute("emailEmpresaMsg", emailEmpresaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    emailEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("emailEmpresa", emailEmpresa);
                    request.setAttribute("emailEmpresaMsg", emailEmpresaMsg);
                    isValid = false;
                }
            }
            else{
                    request.setAttribute("isEmpresa", "sim");
                    emailEmpresaMsg = messages.getString(emailEmpresaMsg);
                    request.setAttribute("emailEmpresa", emailEmpresa);
                    request.setAttribute("emailEmpresaMsg", emailEmpresaMsg);
                    isValid = false;
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
                                request.setAttribute("telefoneEmpresa", telefoneEmpresa);
                                request.setAttribute("telefoneEmpresaMsg", telefoneEmpresaMsg);
                                isValid = false;
                            }
                        }
                        else{
                            request.setAttribute("isEmpresa", "sim");
                            telefoneEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                            request.setAttribute("telefoneEmpresa", telefoneEmpresa);
                            request.setAttribute("telefoneEmpresaMsg", telefoneEmpresaMsg);
                            isValid = false;
                        }
                    }
                    else{
                        request.setAttribute("isEmpresa", "sim");
                        telefoneEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("telefoneEmpresa", telefoneEmpresa);
                        request.setAttribute("telefoneEmpresaMsg", telefoneEmpresaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isEmpresa", "sim");
                    telefoneEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("telefoneEmpresa", telefoneEmpresa);
                    request.setAttribute("telefoneEmpresaMsg", telefoneEmpresaMsg);
                    isValid = false;
                }

            }
            else{
                    request.setAttribute("isEmpresa", "sim");
                    telefoneEmpresaMsg = messages.getString(telefoneEmpresaMsg);
                    request.setAttribute("telefoneEmpresa", telefoneEmpresa);
                    request.setAttribute("telefoneEmpresaMsg", telefoneEmpresaMsg);
                    isValid = false;
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
                    request.setAttribute("contatoEmpresa", contatoEmpresa);
                    request.setAttribute("contatoEmpresaMsg", contatoEmpresaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isEmpresa", "sim");
                contatoEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                request.setAttribute("contatoEmpresa", contatoEmpresa);
                request.setAttribute("contatoEmpresaMsg", contatoEmpresaMsg);
                isValid = false;
            }

            /**
             * Validação da Data de Registro do Convenio da Empresa usando os
             * métodos da Classe ValidaUtils Campo obrigatório
             */

            Date dataRegistroEmpresa = null;
            String dataRegistroEmpresaMsg = "";
            String campo = "Data de Registro";
            dataRegistroEmpresaMsg = ValidaUtils.validaObrigatorio(campo, dataRegistroConvenioEmpresa);
            if (dataRegistroEmpresaMsg.trim().isEmpty()) {
                dataRegistroEmpresaMsg = ValidaUtils.validaDate(campo, dataRegistroConvenioEmpresa);
                if (dataRegistroEmpresaMsg.trim().isEmpty()) {
                    dataRegistroEmpresaMsg = ValidaUtils.validaTamanhoExato(campo, 10, dataRegistroConvenioEmpresa);
                    if (dataRegistroEmpresaMsg.trim().isEmpty()) {
                            try {
                                SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                                dataRegistroEmpresa = format.parse(dataRegistroConvenioEmpresa);
                                request.setAttribute("dataRegistroConvenioEmpresa", dataRegistroEmpresa);
                            } catch (Exception e) {
                                request.setAttribute("isEmpresa", "sim");
                                dataRegistroEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                                request.setAttribute("dataRegistroConvenioEmpresa", dataRegistroConvenioEmpresa);
                                request.setAttribute("dataRegistroEmpresaMsg", dataRegistroEmpresaMsg);
                                isValid = false;
                                System.out.println(e.getMessage());
                            }
                    } else {
                        request.setAttribute("isEmpresa", "sim");
                        dataRegistroEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("dataRegistroConvenioEmpresa", dataRegistroConvenioEmpresa);
                        System.out.println(dataRegistroEmpresa);
                        request.setAttribute("dataRegistroEmpresaMsg", dataRegistroEmpresaMsg);
                        isValid = false;
                        //TODO Fazer log
                    }

                } else {
                    request.setAttribute("isEmpresa", "sim");
                    dataRegistroEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("dataRegistroConvenioEmpresa", dataRegistroConvenioEmpresa);
                    request.setAttribute("dataRegistroEmpresaMsg", dataRegistroEmpresaMsg);
                    isValid = false;
                    //TODO Fazer log
                    System.out.println(dataRegistroEmpresaMsg);
                }
            } else {
                request.setAttribute("isEmpresa", "sim");
                dataRegistroEmpresaMsg = messages.getString(dataRegistroEmpresaMsg);
                request.setAttribute("dataRegistroConvenioEmpresa", dataRegistroConvenioEmpresa);
                request.setAttribute("dataRegistroEmpresaMsg", dataRegistroEmpresaMsg);
                isValid = false;
                System.out.println(dataRegistroEmpresaMsg);
            }   
            
            String numeroEmpresaMsg = "";
            Integer numeroEmp = Integer.parseInt(numeroEmpresa);
            numeroEmpresaMsg = ValidaUtils.validaObrigatorio("Número Convênio Empresa", numeroEmpresa);
            if (numeroEmpresaMsg.trim().isEmpty()) {
                numeroEmpresaMsg = ValidaUtils.validaInteger("Número Convênio Empresa", numeroEmpresa);
                if (numeroEmpresaMsg.trim().isEmpty()) {
                    numeroEmpresaMsg = ValidaUtils.validaTamanho("Número Convênio Empresa", 5, numeroEmpresa);
                    if (numeroEmpresaMsg.trim().isEmpty()) {
                        Convenio conv = ConvenioServices.buscarConvenioByNumeroConvenio(numeroEmpresa);
                        if (conv == null || conv == convenio) {
                            if(numeroEmp != 0){
                                request.setAttribute("numeroEmpresa", numeroEmpresa);
                            } else {
                                request.setAttribute("isEmpresa", "sim");
                                numeroEmpresaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                                request.setAttribute("numeroEmpresaMsg", numeroEmpresaMsg);
                                isValid = false;
                            }
                        } else {
                            request.setAttribute("isEmpresa", "sim");
                            numeroEmpresaMsg = messages.getString("br.cefetrj.sisgee.valida_cadastro_empresa_servlet.msg_numeroConvenio_invalido");
                            request.setAttribute("numeroEmpresaMsg", numeroEmpresaMsg);
                            isValid = false;
                        }
                    } else {
                        request.setAttribute("isEmpresa", "sim");
                        numeroEmpresaMsg = messages.getString(numeroEmpresaMsg);
                        numeroEmpresaMsg = ServletUtils.mensagemFormatada(numeroEmpresaMsg, locale, 5);
                        request.setAttribute("numeroEmpresaMsg", numeroEmpresaMsg);
                        isValid = false;
                    }
                } else {
                    request.setAttribute("isEmpresa", "sim");
                    numeroEmpresaMsg = messages.getString(numeroEmpresaMsg);
                    numeroEmpresaMsg = ServletUtils.mensagemFormatada(numeroEmpresaMsg, locale, 5);
                    request.setAttribute("numeroEmpresaMsg", numeroEmpresaMsg);
                    isValid = false;
                }
            } else {
                request.setAttribute("isEmpresa", "sim");
                numeroEmpresaMsg = messages.getString(numeroEmpresaMsg);
                request.setAttribute("numeroEmpresaMsg", numeroEmpresaMsg);
                isValid = false;
            }
            
            String anoEmpresaMsg = "";
            anoEmpresaMsg = ValidaUtils.validaObrigatorio("Ano Convênio Empresa", anoEmpresa);
            if (anoEmpresaMsg.trim().isEmpty()) {
                anoEmpresaMsg = ValidaUtils.validaInteger("Ano Convênio Empresa", anoEmpresa);
                if (anoEmpresaMsg.trim().isEmpty()) {
                    anoEmpresaMsg = ValidaUtils.validaTamanhoExato("Ano Convênio Empresa", 4, anoEmpresa);
                    if (anoEmpresaMsg.trim().isEmpty()) {
                        request.setAttribute("anoEmpresa", anoEmpresa);
                    } else {
                        request.setAttribute("isEmpresa", "sim");
                        anoEmpresaMsg = messages.getString(anoEmpresaMsg);
                        anoEmpresaMsg = ServletUtils.mensagemFormatada(anoEmpresaMsg, locale, 4);
                        request.setAttribute("anoEmpresaMsg", anoEmpresaMsg);
                        isValid = false;
                    }
                } else {
                    request.setAttribute("isEmpresa", "sim");
                    anoEmpresaMsg = messages.getString(anoEmpresaMsg);
                    anoEmpresaMsg = ServletUtils.mensagemFormatada(anoEmpresaMsg, locale, 4);
                    request.setAttribute("anoEmpresaMsg", anoEmpresaMsg);
                    isValid = false;
                }
            } else {
                request.setAttribute("isEmpresa", "sim");
                anoEmpresaMsg = messages.getString(anoEmpresaMsg);
                request.setAttribute("anoEmpresaMsg", anoEmpresaMsg);
                isValid = false;
            }

        }
        else{
            /**
             * Validação do CPF da pessoa usando os métodos da Classe
             * ValidaUtils Campo obrigatório; Tamanho de 11 caracteres;
             */
            
            String cpfPessoaMsg = "";
            cpfPessoaMsg = ValidaUtils.validaObrigatorio("cpfPessoa", cpfPessoa);
            if(cpfPessoaMsg.trim().isEmpty()){
                //remove caracteres especiais antes de fazer a validação numérica do CPF
                cpfPessoa = cpfPessoa.replaceAll("[.|/|-]", "");
                cpfPessoaMsg = ValidaUtils.validaInteger("cpfPessoa", cpfPessoa);
                if(cpfPessoaMsg.trim().isEmpty()){
                    cpfPessoaMsg = ValidaUtils.validaTamanhoExato("cpfPessoa", 11, cpfPessoa);
                    if(cpfPessoaMsg.trim().isEmpty()){
                        request.setAttribute("cpfPessoa", cpfPessoa);
                    }
                    else{
                        request.setAttribute("isPessoa", "sim");
                        cpfPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("cpfPessoa", cpfPessoa);
                        request.setAttribute("cpfPessoaMsg", cpfPessoaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isPessoa", "sim");
                    cpfPessoaMsg = messages.getString("br.cefetrj.sisgee.valida_utils.msg_valida_numerico");
                    request.setAttribute("cpfPessoa", cpfPessoa);
                    request.setAttribute("cpfPessoaMsg", cpfPessoaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isPessoa", "sim");
                cpfPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                cpfPessoaMsg = ServletUtils.mensagemFormatada(cpfPessoaMsg, locale, 11);
                request.setAttribute("cpfPessoa", cpfPessoa);
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
                        request.setAttribute("nomePessoa", nomePessoa);
                        request.setAttribute("nomePessoaMsg", nomePessoaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isPessoa", "sim");
                    nomePessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("nomePessoa", nomePessoa);
                    request.setAttribute("nomePessoaMsg", nomePessoaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isPessoa", "sim");
                nomePessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                request.setAttribute("nomePessoa", nomePessoa);
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
                        request.setAttribute("emailPessoa", emailPessoa);
                        request.setAttribute("emailPessoaMsg", emailPessoaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isPessoa", "sim");
                    emailPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("emailPessoa", emailPessoa);
                    request.setAttribute("emailPessoaMsg", emailPessoaMsg);
                    isValid = false;
                }
            }
            else{
                    request.setAttribute("isPessoa", "sim");
                    emailPessoaMsg = messages.getString(emailPessoaMsg);
                    request.setAttribute("emailPessoa", emailPessoa);
                    request.setAttribute("emailPessoaMsg", emailPessoaMsg);
                    isValid = false;
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
                            request.setAttribute("telefonePessoa", telefonePessoa);
                            request.setAttribute("telefonePessoaMsg", telefonePessoaMsg);
                            isValid = false;
                         }
                     }
                     else{
                        request.setAttribute("isPessoa", "sim");
                        telefonePessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("telefonePessoa", telefonePessoa);
                        request.setAttribute("telefonePessoaMsg", telefonePessoaMsg);
                        isValid = false;
                     }
                 }
                 else{
                    request.setAttribute("isPessoa", "sim");
                    telefonePessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("telefonePessoa", telefonePessoa);
                    request.setAttribute("telefonePessoaMsg", telefonePessoaMsg);
                    isValid = false;
                 }
            }
            else{
                    request.setAttribute("isPessoa", "sim");
                    telefonePessoaMsg = messages.getString(telefonePessoaMsg);
                    request.setAttribute("telefonePessoa", telefonePessoa);
                    request.setAttribute("telefonePessoaMsg", telefonePessoaMsg);
                    isValid = false;
            }

            /**
             * Validação da Data de Registro do Convenio da Pessoa usando os
             * métodos da Classe ValidaUtils Campo obrigatório
             */
            String dataRegistroPessoaMsg = "";
            Date dataRegistroPessoa = null;
            String campo = "dataRegistroConvenioPessoa";
            dataRegistroPessoaMsg = ValidaUtils.validaObrigatorio(campo, dataRegistroConvenioPessoa);
            if (dataRegistroPessoaMsg.trim().isEmpty()) {
                dataRegistroPessoaMsg = ValidaUtils.validaDate(campo, dataRegistroConvenioPessoa);
                if (dataRegistroPessoaMsg.trim().isEmpty()) {
                    dataRegistroPessoaMsg = ValidaUtils.validaTamanhoExato(campo, 10, dataRegistroConvenioPessoa);
                    if (dataRegistroPessoaMsg.trim().isEmpty()) {
                            try{
                                SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                                dataRegistroPessoa = format.parse(dataRegistroConvenioPessoa);
                                request.setAttribute("dataRegistroConvenioPessoa", dataRegistroPessoa);
                            }catch(Exception e){
                                request.setAttribute("isPessoa", "sim");
                                dataRegistroPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                                request.setAttribute("dataRegistroConvenioPessoa", dataRegistroConvenioPessoa);
                                request.setAttribute("dataRegistroPessoaMsg", dataRegistroPessoaMsg);
                                isValid = false;
                                System.out.println(e.getMessage());
                            }
                    }
                    else{
                        request.setAttribute("isPessoa", "sim");
                        dataRegistroPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                        request.setAttribute("dataRegistroConvenioPessoa", dataRegistroConvenioPessoa);
                        request.setAttribute("dataRegistroPessoaMsg", dataRegistroPessoaMsg);
                        isValid = false;
                    }
                }
                else{
                    request.setAttribute("isPessoa", "sim");
                    dataRegistroPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                    request.setAttribute("dataRegistroConvenioPessoa", dataRegistroConvenioPessoa);
                    request.setAttribute("dataRegistroPessoaMsg", dataRegistroPessoaMsg);
                    isValid = false;
                }
            }
            else{
                request.setAttribute("isPessoa", "sim");
                dataRegistroPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                request.setAttribute("dataRegistroConvenioPessoa", dataRegistroConvenioPessoa);
                request.setAttribute("dataRegistroPessoaMsg", dataRegistroPessoaMsg);
                isValid = false;
            }
            
            String numeroPessoaMsg = "";
            Integer numeroPes = Integer.parseInt(numeroPessoa);
            numeroPessoaMsg = ValidaUtils.validaObrigatorio("Número Convênio Pessoa", numeroPessoa);
            if (numeroPessoaMsg.trim().isEmpty()) {
                numeroPessoaMsg = ValidaUtils.validaInteger("Número Convênio Pessoa", numeroPessoa);
                if (numeroPessoaMsg.trim().isEmpty()) {
                    numeroPessoaMsg = ValidaUtils.validaTamanho("Número Convênio Pessoa", 5, numeroPessoa);
                    if (numeroPessoaMsg.trim().isEmpty()) {
                        Convenio conv = ConvenioServices.buscarConvenioByNumeroConvenio(numeroPessoa);
                        if (conv == null || conv == convenio) {
                            if(numeroPes != 0){
                                request.setAttribute("numeroPessoa", numeroPessoa);
                            } else {
                                request.setAttribute("isPessoa", "sim");
                                numeroPessoaMsg = messages.getString("br.cefetrj.sisgee.form_termo_estagio_servlet.valor_invalido");
                                request.setAttribute("numeroPessoaMsg", numeroPessoaMsg);
                                isValid = false;
                            }
                        } else {
                            request.setAttribute("isPessoa", "sim");
                            numeroPessoaMsg = messages.getString("br.cefetrj.sisgee.valida_cadastro_empresa_servlet.msg_numeroConvenio_invalido");
                            request.setAttribute("numeroPessoaMsg", numeroPessoaMsg);
                            isValid = false;
                        }
                    } else {
                        request.setAttribute("isPessoa", "sim");
                        numeroPessoaMsg = messages.getString(numeroPessoaMsg);
                        numeroPessoaMsg = ServletUtils.mensagemFormatada(numeroPessoaMsg, locale, 5);
                        request.setAttribute("numeroPessoaMsg", numeroPessoaMsg);
                        isValid = false;
                    }
                } else {
                    request.setAttribute("isPessoa", "sim");
                    numeroPessoaMsg = messages.getString(numeroPessoaMsg);
                    numeroPessoaMsg = ServletUtils.mensagemFormatada(numeroPessoaMsg, locale, 5);
                    request.setAttribute("numeroPessoaMsg", numeroPessoaMsg);
                    isValid = false;
                }
            } else {
                request.setAttribute("isPessoa", "sim");
                numeroPessoaMsg = messages.getString(numeroPessoaMsg);
                request.setAttribute("numeroPessoaMsg", numeroPessoaMsg);
                isValid = false;
            }

            String anoPessoaMsg = "";
            anoPessoaMsg = ValidaUtils.validaObrigatorio("Ano Convênio Pessoa", anoPessoa);
            if (anoPessoaMsg.trim().isEmpty()) {
                anoPessoaMsg = ValidaUtils.validaInteger("Ano Convênio Pessoa", anoPessoa);
                if (anoPessoaMsg.trim().isEmpty()) {
                    anoPessoaMsg = ValidaUtils.validaTamanhoExato("Ano Convênio Pessoa", 4, anoPessoa);
                    if (anoPessoaMsg.trim().isEmpty()) {
                        request.setAttribute("anoPessoa", anoPessoa);
                    } else {
                        request.setAttribute("isPessoa", "sim");
                        anoPessoaMsg = messages.getString(anoPessoaMsg);
                        anoPessoaMsg = ServletUtils.mensagemFormatada(anoPessoaMsg, locale, 4);
                        request.setAttribute("anoPessoaMsg", anoPessoaMsg);
                        isValid = false;
                    }
                } else {
                    request.setAttribute("isPessoa", "sim");
                    anoPessoaMsg = messages.getString(anoPessoaMsg);
                    anoPessoaMsg = ServletUtils.mensagemFormatada(anoPessoaMsg, locale, 4);
                    request.setAttribute("anoPessoaMsg", anoPessoaMsg);
                    isValid = false;
                }
            } else {
                request.setAttribute("isPessoa", "sim");
                anoPessoaMsg = messages.getString(anoPessoaMsg);
                request.setAttribute("anoPessoaMsg", anoPessoaMsg);
                isValid = false;
            }

        }
        
        if(isValid){
            System.out.println("chegou");
            request.getRequestDispatcher("/SalvarAlteracaoConvenioServlet").forward(request, response);
        }
        else{
            //System.out.println(convenio.getEmpresa().getTelefoneEmpresa());
            String msg = messages.getString("br.cefetrj.sisgee.valida_cadastro_empresa_servlet.msg_atencao");
            request.setAttribute("numeroSugerido", convenio.getNumero());
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/form_alterar_convenio.jsp").forward(request, response);
        }


    }
    

}