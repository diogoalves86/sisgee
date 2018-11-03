/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cefetrj.sisgee.view.termoestagio;

import br.cefetrj.sisgee.control.AlunoServices;
import br.cefetrj.sisgee.control.TermoAditivoServices;
import br.cefetrj.sisgee.control.TermoEstagioServices;
import br.cefetrj.sisgee.model.entity.Aluno;
import br.cefetrj.sisgee.model.entity.TermoAditivo;
import br.cefetrj.sisgee.model.entity.TermoEstagio;
import br.cefetrj.sisgee.view.utils.UF;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    }
}
