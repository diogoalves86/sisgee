/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cefetrj.sisgee.view.termoestagio;

import br.cefetrj.sisgee.control.AlunoServices;
import br.cefetrj.sisgee.control.ConvenioServices;
import br.cefetrj.sisgee.control.TermoAditivoServices;
import br.cefetrj.sisgee.control.TermoEstagioServices;
import br.cefetrj.sisgee.model.entity.AgenteIntegracao;
import br.cefetrj.sisgee.model.entity.Aluno;
import br.cefetrj.sisgee.model.entity.Convenio;
import br.cefetrj.sisgee.model.entity.ProfessorOrientador;
import br.cefetrj.sisgee.model.entity.TermoAditivo;
import br.cefetrj.sisgee.model.entity.TermoEstagio;
import br.cefetrj.sisgee.view.utils.ServletUtils;
import br.cefetrj.sisgee.view.utils.UF;
import java.io.IOException;
import java.util.Date;
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
        if(idEstagio!=null)
            termoEstagio=TermoEstagioServices.buscarTermoEstagio(Integer.parseInt(idEstagio));
        if(idAluno!=null)
            termoAditivo=TermoAditivoServices.buscarTermoAditivo(Integer.parseInt(idAluno));
        
        req.setAttribute("uf", uf);
                        
        /** Dados de aluno*/
        req.setAttribute("alMatricula", aluno.getMatricula());
        req.setAttribute("alNome", aluno.getPessoa().getNome());
        req.setAttribute("alCampus", aluno.getCurso().getCampus().getNomeCampus());
        req.setAttribute("alCurso", aluno.getCurso());

        /** Dados de convenio*/
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

        //OBRIGATÓRIO
        Date dataInicioTermoEstagio         = (Date)request.getAttribute("dataInicio");
        Integer cargaHorariaTermoEstagio    = (Integer)request.getAttribute("cargaHoraria");
        Float valorBolsa                    = (Float)request.getAttribute("valor");
        String enderecoTermoEstagio         = (String)request.getAttribute("enderecoTermoEstagio");
        String numeroEnderecoTermoEstagio   = (String)request.getAttribute("numeroEnderecoTermoEstagio");
        String complementoEnderecoTermoEstagio = (String)request.getAttribute("complementoEnderecoTermoEstagio");
        String bairroEnderecoTermoEstagio   = (String)request.getAttribute("bairroEnderecoTermoEstagio");
        String cepEnderecoTermoEstagio      = (String)request.getAttribute("cepEnderecoTermoEstagio");
        String cidadeEnderecoTermoEstagio   = (String)request.getAttribute("cidadeEnderecoTermoEstagio");
        String estadoEnderecoTermoEstagio   = (String)request.getAttribute("estadoEnderecoTermoEstagio");
        Boolean eEstagioObrigatorio         = (Boolean)request.getAttribute("obrigatorio");

        String nomeSupervisor               = request.getParameter("nomeSupervisor");
        String cargoSupervisor              = request.getParameter("cargoSupervisor");    
        String nomeAgenciada                = request.getParameter("nomeAgenciada");                

        Aluno aluno = new Aluno((Integer)request.getAttribute("idAluno")); 	

        //OBRIGATÓRIO
        String convenionum = (String)request.getAttribute("idConvenio");
        System.out.println("termo estagio ------>>>>>>>>>>" + convenionum);
        Convenio convenio = ConvenioServices.buscarConvenioByNumeroConvenio(convenionum);
        //NÃO OBRIGATÓRIO
        Boolean hasDataFim          = (Boolean)request.getAttribute("hasDataFim");		
        Boolean hasProfessor        = (Boolean)request.getAttribute("hasProfessor");
        String isAgenteIntegracao   = (String)request.getAttribute("isAgenteIntegracao");

        Date dataFimTermoEstagio = null;
        ProfessorOrientador professorOrientador = null;
        AgenteIntegracao agenteIntegracao = null;

        if(hasDataFim != null && hasDataFim == true)
            dataFimTermoEstagio = (Date)request.getAttribute("dataFim");
        
        if(hasProfessor != null && hasProfessor == true)
            professorOrientador = new ProfessorOrientador((Integer)request.getAttribute("idProfessor"));
        

        TermoEstagio termoEstagio = new TermoEstagio(dataInicioTermoEstagio, dataFimTermoEstagio, cargaHorariaTermoEstagio,
                         valorBolsa,  enderecoTermoEstagio,  numeroEnderecoTermoEstagio,
                         complementoEnderecoTermoEstagio,  bairroEnderecoTermoEstagio,  cepEnderecoTermoEstagio,
                         cidadeEnderecoTermoEstagio,  estadoEnderecoTermoEstagio,  eEstagioObrigatorio,
                         aluno,  convenio,  professorOrientador, nomeSupervisor, cargoSupervisor, nomeAgenciada);

        String msg = "";
        Logger lg = Logger.getLogger(IncluirTermoEstagioServlet.class);
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
