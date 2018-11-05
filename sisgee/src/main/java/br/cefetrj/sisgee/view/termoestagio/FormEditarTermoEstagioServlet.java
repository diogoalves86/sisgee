/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cefetrj.sisgee.view.termoestagio;

import br.cefetrj.sisgee.control.AlunoServices;
import br.cefetrj.sisgee.control.ConvenioServices;
import br.cefetrj.sisgee.control.ProfessorOrientadorServices;
import br.cefetrj.sisgee.control.TermoAditivoServices;
import br.cefetrj.sisgee.control.TermoEstagioServices;
import br.cefetrj.sisgee.model.entity.AgenteIntegracao;
import br.cefetrj.sisgee.model.entity.Aluno;
import br.cefetrj.sisgee.model.entity.Convenio;
import br.cefetrj.sisgee.model.entity.Empresa;
import br.cefetrj.sisgee.model.entity.ProfessorOrientador;
import br.cefetrj.sisgee.model.entity.TermoAditivo;
import br.cefetrj.sisgee.model.entity.TermoEstagio;
import br.cefetrj.sisgee.view.utils.ServletUtils;
import br.cefetrj.sisgee.view.utils.UF;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author diogo
 */
@WebServlet(name = "FormEditarTermoEstagioServlet", urlPatterns = {"/EditarTermoEAditivo"})
public class FormEditarTermoEstagioServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String idEstagio = req.getParameter("ide");
        String idAluno = req.getParameter("ida");
        String matricula = req.getParameter("matricula");
        UF[] uf = UF.asList();
        TermoEstagio termoEstagio=null;
        TermoAditivo termoAditivo=null;
        
        Aluno aluno=AlunoServices.buscarAlunoByMatricula(matricula);
        req.getServletContext().setAttribute("aluno", aluno);
        if(idEstagio!=null){
            termoEstagio=TermoEstagioServices.buscarTermoEstagio(Integer.parseInt(idEstagio));
            req.getServletContext().setAttribute("termoEstagio", termoEstagio);
            
            req.getServletContext().setAttribute("professorOrientador", termoEstagio.getProfessorOrientador());
            
            /** Dados do termo de estágio */
            req.setAttribute("idTermoEstagio", idEstagio);
        }
        
        if(idAluno!=null){
            termoAditivo=TermoAditivoServices.buscarTermoAditivo(Integer.parseInt(idAluno));
            req.getServletContext().setAttribute("termoAditivo", termoAditivo);
            /** Dados de aluno */
            req.setAttribute("idAluno", aluno.getIdAluno());
        }
        req.setAttribute("uf", uf);
        
                        
        /** Dados de aluno*/
        req.setAttribute("alMatricula", aluno.getMatricula());
        req.setAttribute("alNome", aluno.getPessoa().getNome());
        req.setAttribute("alCampus", aluno.getCurso().getCampus().getNomeCampus());
        req.setAttribute("alCurso", aluno.getCurso());

        /** Dados de convenio*/
        req.getServletContext().setAttribute("convenio", termoEstagio.getConvenio());
        req.getServletContext().setAttribute("convenioEmpresa", termoEstagio.getConvenio().getEmpresa());
        
        req.setAttribute("cvNumero", termoEstagio.getConvenio().getNumeroConvenio());
        req.setAttribute("cvNumero2", termoEstagio.getConvenio().getNumero());
        if(termoEstagio.getConvenio().getEmpresa()==null){
            req.setAttribute("cvNome", termoEstagio.getConvenio().getPessoa().getNome());
            req.setAttribute("cvId", termoEstagio.getConvenio().getIdConvenio());
            req.setAttribute("tConvenio","pf");
            req.setAttribute("cvCpfCnpj",termoEstagio.getConvenio().getPessoa().getCpf());
            req.setAttribute("nomeAgenciada",termoEstagio.getNomeAgenciada());

        }else{
            req.setAttribute("cvNome", termoEstagio.getConvenio().getEmpresa().getRazaoSocial());
            req.setAttribute("tConvenio","pj");
            req.setAttribute("agIntegracao",termoEstagio.getConvenio().getEmpresa().isAgenteIntegracao());
            req.setAttribute("cvCpfCnpj", termoEstagio.getConvenio().getEmpresa().getCnpjEmpresa());
            req.setAttribute("nomeAgenciada",termoEstagio.getNomeAgenciada());
        }

        /** Dados de Vigência */
        req.setAttribute("vidataInicioTermoEstagio",termoEstagio.getDataInicioTermoEstagio2());
        req.setAttribute("vidataFimTermoEstagio",termoEstagio.getDataFimTermoEstagioVisu(termoAditivo));

        /** Dados de Carga Horária */
        req.setAttribute("cacargaHorariaTermoEstagio",termoEstagio.getCargaHorariaTermoEstagioVisu(termoAditivo));

        /** Dados de Valor Bolsa */
        req.setAttribute("vavalorBolsa",termoEstagio.getValorBolsaVisu(termoAditivo));
        System.out.println("aqui"+termoEstagio.getValorBolsaVisu(termoAditivo));
        /** Dados de Local */
        req.getServletContext().setAttribute("enenderecoTermoEstagio",termoEstagio.getEnderecoTermoEstagioVisu(termoAditivo));
        req.setAttribute("ennumeroEnderecoTermoEstagio",termoEstagio.getNumeroEnderecoTermoEstagioVisu(termoAditivo));
        req.setAttribute("encomplementoEnderecoTermoEstagio",termoEstagio.getComplementoEnderecoTermoEstagioVisu(termoAditivo));
        req.setAttribute("enbairroEnderecoTermoEstagio",termoEstagio.getBairroEnderecoTermoEstagioVisu(termoAditivo));
        req.setAttribute("encidadeEnderecoTermoEstagio",termoEstagio.getCidadeEnderecoTermoEstagioVisu(termoAditivo));
        req.setAttribute("enuf",termoEstagio.getEstadoEnderecoTermoEstagioVisu(termoAditivo));
        req.setAttribute("encepEnderecoTermoEstagio",termoEstagio.getCepEnderecoTermoEstagioVisu(termoAditivo));

        /** Dados de Supervisor */

        req.setAttribute("eobrigatorio",termoEstagio.getEEstagioObrigatorio());
        req.setAttribute("nomeSupervisor",termoEstagio.getNomeSupervisorVisu(termoAditivo));
        req.setAttribute("cargoSupervisor",termoEstagio.getCargoSupervisorVisu(termoAditivo));

        /** Dados de Professor */
        req.setAttribute("pfnomeprofessor",termoEstagio.getProfessorOrientadorVisu(termoAditivo));
                        
        req.getRequestDispatcher("/form_termo_estagio_edita.jsp").forward(req, resp);
    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Locale locale = ServletUtils.getLocale(request);
        ResourceBundle messages = ResourceBundle.getBundle("Messages", locale);
        
        TermoEstagio termoEstagio = (TermoEstagio) request.getServletContext().getAttribute("termoEstagio");
        
        // RECUPERANDO RELACIONAMENTOS
        List<TermoAditivo> termosAditivos   = (List<TermoAditivo>)request.getServletContext().getAttribute("termoAditivo");
        Aluno aluno = (Aluno)request.getServletContext().getAttribute("aluno");
        ProfessorOrientador prof = (ProfessorOrientador)request.getServletContext().getAttribute("professorOrientador");
        Convenio convenio = (Convenio)request.getServletContext().getAttribute("convenio");
        Empresa convenioEmpresa = (Empresa) request.getServletContext().getAttribute("convenioEmpresa");
                
        //OBRIGATÓRIO
        Date dataInicioTermoEstagio         = new Date(request.getParameter("dataInicioTermoEstagio"));        
        Date dataFimTermoEstagio            = new Date(request.getParameter("dataFimTermoEstagio"));
        Integer cargaHorariaTermoEstagio    = Integer.parseInt(request.getParameter("cargaHorariaTermoEstagio"));
        Float valorBolsa                    = Float.parseFloat(request.getParameter("valorBolsa"));
        String enderecoTermoEstagio         = (String)request.getParameter("enderecoTermoEstagio");
        String numeroEnderecoTermoEstagio   = (String)request.getParameter("numeroEnderecoTermoEstagio");
        String complementoEnderecoTermoEstagio = (String)request.getParameter("complementoEnderecoTermoEstagio");
        String bairroEnderecoTermoEstagio   = (String)request.getParameter("bairroEnderecoTermoEstagio");
        String cepEnderecoTermoEstagio      = (String)request.getParameter("cepEnderecoTermoEstagio");
        String cidadeEnderecoTermoEstagio   = (String)request.getParameter("cidadeEnderecoTermoEstagio");
        String estadoEnderecoTermoEstagio   = (String)request.getParameter("estadoEnderecoTermoEstagio");
        Boolean eEstagioObrigatorio         = Boolean.parseBoolean(request.getParameter("eobrigatorio"));

        String nomeSupervisor               = request.getParameter("nomeSupervisor");
        String cargoSupervisor              = request.getParameter("cargoSupervisor");    
        String nomeAgenciada                = request.getParameter("nomeAgenciada");                

        
        //OBRIGATÓRIO
        Boolean hasAluno            = (String)request.getParameter("idAluno") != null && !((String)request.getParameter("idAluno")).equals("");
        Boolean hasIdConvenio       = (String)request.getParameter("idConvenio") != null && !((String)request.getParameter("idConvenio")).equals("");
        //NÃO OBRIGATÓRIO
        Boolean hasDataFim          = (String)request.getParameter("dataFimTermoEstagio") != null && !((String)request.getParameter("dataFimTermoEstagio")).equals("");
        Boolean hasProfessor        = (String)request.getParameter("idProfessorOrientador") != null && !((String)request.getParameter("idProfessorOrientador")).equals("");
        String isAgenteIntegracao   = (String)request.getParameter("isAgenteIntegracao");

        
        if(hasDataFim)
            dataFimTermoEstagio = new Date(request.getParameter("dataFimTermoEstagio"));
        
        if(hasProfessor)
            prof = ProfessorOrientadorServices.buscarProfessorOrientador(new ProfessorOrientador(Integer.parseInt((String)request.getParameter("idProfessorOrientador"))));
        
        if (hasIdConvenio)
            convenio = ConvenioServices.buscarConvenioByNumeroConvenio(request.getParameter("numeroConvenio"));
        
        if(hasAluno)
            aluno = AlunoServices.buscarAluno(new Aluno(Integer.parseInt((String)request.getParameter("idAluno"))));
        
        
        Aluno alunoaux = AlunoServices.buscarAluno(aluno);
        Convenio convenioaux = ConvenioServices.buscarConvenio(convenio);
        ProfessorOrientador profAux = ProfessorOrientadorServices.buscarProfessorOrientador(prof);
        // APLICANDO RELACIONAMENTOS RECUPERADOS
        termoEstagio.setTermosAditivos(termosAditivos);
        termoEstagio.getConvenio().setEmpresa(convenioEmpresa);
        
        System.out.println("Id Termo Estágio: "+termoEstagio.getIdTermoEstagio());
        String msg = "";
        Logger lg = Logger.getLogger(FormEditarTermoEstagioServlet.class);
        try{

                TermoEstagioServices.alterarTermoEstagio(termoEstagio);
                msg = messages.getString("br.cefetrj.sisgee.incluir_termo_estagio_servlet.msg_sucesso");
                request.setAttribute("msg", msg);

                lg.info(msg);
                request.getRequestDispatcher("/index.jsp").forward(request, response);			


        }catch(Exception e) {
                msg = messages.getString("br.cefetrj.sisgee.incluir_termo_estagio_servlet.msg_falha");
                request.setAttribute("msg", msg);
                System.out.println("Erro no Try Catch do IncluirTermoEstagioServlet " + e);
                lg.error("Exception ao tentar inserir o Termo de Estágio", e);
                request.getRequestDispatcher("FormTermoEstagioServlet").forward(request, response);			

        }

        System.out.println(msg);

    }
}
