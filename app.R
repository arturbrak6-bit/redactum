
# app.R
library(shiny)
library(bslib)
library(rclipboard)
library(officer)

`%||%` <- function(a, b) {
  if (is.null(a) || length(a) == 0 || (length(a) == 1 && is.na(a))) b else a
}

# =========================================================
# CONTEÚDO (mantido integralmente; sem abreviar exemplos)
# =========================================================
conteudo <- list(
  "Systematic Review and Meta-Analysis" = list(
    "JAMA Network" = list(
      "Introdução" = list(
        partes = list(
          list(
            titulo = "Importância do Tema",
            legenda = "Sugestão de início",
            exemplos = list(
              list(
                texto      = "Major depressive disorder (MDD) is currently the leading cause of functional disability and one of the most critical mental health issues.",
                explicacao = "O autor optou por não definir o Transtorno Depressivo Maior, condição que delimita a população de sua meta-análise, possivelmente por ser amplamente conhecida pelo público em geral e dispensar definição. Em contrapartida, apresentou dois fatos que ressaltam a relevância do transtorno no cenário global e fundamentam a necessidade do estudo, o que pode aumentar o interesse do revisor e, consequentemente, as chances de publicação."
              ),
              list(
                texto = "Calcific aortic valve stenosis is the commonest form of valvular heart disease worldwide, affecting almost 3% of the population older than 65 years.",
                explicacao = "Neste caso, o autor apresenta a população de interesse — patients with calcific aortic stenosis — situando-a em um contexto global sobre sua importância."
              ),
              list(
                texto = "Climate change and air pollution are major health threats.",
                explicacao = "O autor trouxe uma frase curta e, de certa forma genérica, que evidência determinada situação, nesse caso as mudanças climáticas e a poluição do ar, como um problema importante para a saúde humana. Essa técnica de escrita pode ser facilmente replicada, mas deve ser usada com cautela dado sua baixa complexidade."
              ),
              list(
                texto = "Many psychiatric disorders have been found to occur more frequently in persons with epilepsy (PWE) than in the general population.",
                explicacao = "Aqui o texto é iniciado com uma hipótese correlacional (transtornos psiquiátricos x epilepsia) já testada em estudos prévios mas que talvez permaneça inconclusiva, o que serve de base para que autor firme a importância e necessidade da realização de seu estudo."
              )
            )
          ),
          list(
            titulo = "Questão de Pesquisa",
            legenda = "Aprofundamento",
            exemplos = list(
              list(
                texto      = "The estimated response rate to initial treatment is approximately 50%, requiring alternative treatments when the initial approach is insufficient after 4 to 8 weeks.",
                explicacao = "Esse trecho complementar ao primeiro período destaca ao leitor um dado importante a população de seu estudo."
              ),
              list(
                texto      = "Recent studies have suggested an association between the plasma concentration of the atherogenic lipoprotein particle, lipoprotein(a), and the risk of incident aortic stenosis. While there are currently no pharmacological treatments approved to prevent or treat aortic stenosis, lipoprotein(a) is now considered a prime therapeutic target for aortic stenosis.",
                explicacao = "Aqui o autor empregou um viés mais acentuado para reforçar a hipótese central a ser provada no estudo."
              ),
              list(
                texto      = "Increasing concentrations of ambient air pollutants are associated with worsened clinical outcomes of inflammatory conditions, cardiovascular diseases, and respiratory diseases. Increasing global temperatures, shifting climates, and extreme weather events are also associated with increased morbidity, informing updates in regulatory recommendations for public health guidelines, air quality standards, and environmental protections.",
                explicacao = "O mesmo acontece aqui."
              ),
              list(
                texto      = "The presence of psychiatric disorders and epilepsy is associated with a higher impact on patients, their families, and society than epilepsy without psychiatric disorders.",
                explicacao = "A técnica nesse trecho é semelhante as demais. Repare que, em todos os exemplos, os autores empregaram técnicas de escrita para dar subsídio e reforçar pontos importantes que ainda não foram completamente exposto ao leitor, mas que dão dicas do que pode se esperar ao decorrer do artigo. Por exemplo, no primeiro estudo, o autor abordou a 'taxa de resposta inicial de 50%' juntamente com a 'necessidade de uso de tratamentos alternativos' para elaborar dois pontos chave: 1 - os antidepressivos comuns são insuficientes em até 50% dos pacientes; 2 - tratamentos alternativos precisam ser explorados (Bright light therapy é um tratamento alternativo)."
              )
            )
          ),
          list(
            titulo = "Evidência prévia",
            legenda = "Introduzir os grupos de seu estudo",
            exemplos = list(
              list(
                texto = "Given this, bright light therapy (BLT) has been studied as a potential adjunctive treatment for MDD, as light exposure is well understood to affect human mood and cognitive function. This effect may arise from retinal ganglion cells, which extend their axons across brain areas involved in mood regulation, including the amygdala, the suprachiasmatic nucleus, and the dorsal raphe nucleus.",
                explicacao = "Nesta parte do texto, é interessante apresentar ao leitor um panorama do que já foi publicado na área, destacando o que está confirmado — isso funciona como técnica para, adiante, contrapor esses pontos ao que ainda não está confirmado ou permanece desconhecido. Além disso, você também pode se aprofundar em algum ponto de interesse. Nesse caso, o autor abordou um pouco do que se sabe sobre o mecanismo de efeito da terapia, uma vez que o conhecimento sobre isso ainda é incompleto."
              ),
              list(
                texto = "Although the evidence supporting lipoprotein(a) as an important initiator of aortic stenosis is strong, whether plasma lipoprotein(a) concentrations predict the progression of aortic stenosis has not been thoroughly established.",
                explicacao = "O mesmo ocorre de forma semelhante aqui, porém com uma roupagem diferente."
              ),
              list(
                texto = "There is a growing body of evidence that suggests an association between environmental conditions and atopic dermatitis, which is the most common chronic inflammatory skin condition and affects up to 15% of individuals globally.",
                explicacao = "Aqui, o autor optou por reforçar a importância da condição estudada no mesmo período em que destacou o que há de evidência no campo."
              ),
              list(
                texto = "Previous systematic reviews have identified a high prevalence of psychiatric comorbidities in PWE, including anxiety, depression, and suicide.",
                explicacao = "Nesse ponto, repare na técnica de escrita empregada em cada exemplo: verbos no passado (studied; identified) para indicar o que há de evidência."
              )
            )
          ),
          list(
            titulo = "Contexto Clínico Atual",
            legenda = "Destacar o que é sabido",
            exemplos = list(
              list(
                texto = "Conversely, the efficacy of BLT as an adjunctive treatment is established only for seasonal depressive disorders.",
                explicacao = "Repare que os 4 exemplos, apesar de diferentes, evidenciam um ponto em comum -> Necessidade de mais estudos para preencher determinada lacuna no corpo de evidência (na prática, serve para reforçar a necessidade de seu estudo)."
              ),
              list(
                texto = "Several studies have demonstrated an association between plasma lipoprotein(a) concentrations with aortic stenosis progression using echocardiography, computed tomography (CT), and positron emission tomography, while a recent CT study did not. Each of these studies has been limited by relatively small sample sizes, and we consequently lack a clear idea of disease progression in patients with and without elevated plasma lipoprotein(a) concentrations.",
                explicacao = "Aqui o autor foi além e destrinchou ainda mais sobre o que se tem de evidência no assunto, talvez por já terem sido publicados muitos estudos de certa forma semelhantes ao seu no passado ou para explicitar com maior precisão a lacuna específica que seu trabalho pretende preencher."
              ),
              list(
                texto = "Associations between pollutants, climate, and atopic dermatitis remain uncertain. Some studies have reported increased atopic dermatitis prevalence with increased levels of particulate matter (PM) and harmful gases, like carbon monoxide (CO) and nitrous oxide (NO), while others reported no such association. Some studies have reported that cold weather worsens atopic dermatitis by exacerbating xerosis, while others reported that higher temperatures are associated with worse disease. To our knowledge, research on the association of environmental factors and atopic dermatitis has not been comprehensively synthesized alongside an assessment of the certainty of evidence.",
                explicacao = "O mesmo acontece de forma semelhante aqui, mas com foco nas divergências da literatura no assunto."
              ),
              list(
                texto = "However, less is known about the prevalence of other types of psychiatric disorders among PWE compared with those without epilepsy.",
                explicacao = "Nesse caso, o autor foi mais conciso, o que também é bem-vindo se bem escrito."
              )
            )
          ),
          list(
            titulo = "Limitações de Estudos Anteriores",
            legenda = "Demarcar a necessidade de novos estudos",
            exemplos = list(
              list(
                texto = "Several trials have been conducted in recent years assessing BLT in nonseasonal depressive disorders. Seven new relevant studies comprising nearly 3 times the sample size of the most similar previous meta-analyses have been added to the literature, possibly adding important insights to the body of evidence.",
                explicacao = "Repare que os 4 exemplos, apesar de diferentes, evidenciam um ponto em comum -> Necessidade de mais estudos para preencher determinada lacuna no corpo de evidência (na prática, serve para reforçar a necessidade de seu estudo)."
              ),
              list(
                texto = "Larger multicenter studies are required, particularly those using echocardiography, as this remains the key imaging technique for clinical decision making that is used globally to assess aortic stenosis severity over time.",
                explicacao = "Aqui o autor foi além e destrinchou ainda mais sobre o que se tem de evidência no assunto, talvez por já terem sido publicados muitos estudos de certa forma semelhantes ao seu no passado ou para explicitar com maior precisão a lacuna específica que seu trabalho pretende preencher."
              ),
              list(
                texto = "Although the association between environmental factors and atopic dermatitis has been well studied in childhood through several earlier meta-analyses, a thorough assessment of the evidence in adults is lacking, despite the high prevalence of atopic dermatitis in this population.",
                explicacao = "O mesmo acontece de forma semelhante aqui, mas com foco nas divergências da literatura no assunto."
              ),
              list(
                texto = "Meta-analyses to date have been limited by heterogeneous endpoints and short follow-up durations, potentially underestimating long-term effects.",
                explicacao = "Completa o quadro de limitações destacando heterogeneidade dos desfechos e tempo de seguimento curto, que podem distorcer a magnitude dos efeitos."
              )
            )
          ),
          list(
            titulo = "Objetivo e Expectativas",
            legenda = "Expor de maneira clara o objetivo do seu estudo",
            exemplos = list(
              list(
                texto = "Because BLT may be able to serve as a low-cost adjunctive treatment option for MDD, we aimed to investigate whether BLT is effective in nonseasonal depressive disorders by assessing its outcomes in a more comprehensive analysis and an extensive subset of statistical analyses.",
                explicacao = "Aqui, o autor optou por iniciar a última sentença com sua expectativa para o futuro, e depois expôs de forma clara qual foi o objetivo de seu estudo."
              ),
              list(
                texto = "The objective of the present study was to assess the association of plasma lipoprotein(a) concentrations with hemodynamic aortic stenosis progression assessed by echocardiography in a meta-analysis of 5 longitudinal clinical study cohorts, including 2 studies in which data associating lipoprotein(a) levels and rate of aortic stenosis progression have not been previously published.",
                explicacao = "Nesse exemplo, o autor optou por não incluir suas expectativas, o que também é válido caso elas não sejam totalmente claras."
              ),
              list(
                texto = "The objective of this systematic review and meta-analysis was to synthesize the associations between environmental factors, including air pollution, meteorological conditions, and climate, and outcomes in adults with atopic dermatitis.",
                explicacao = "O mesmo ocorre aqui. Repare na clareza do objetivo."
              ),
              list(
                texto = "This systematic review and meta-analysis aims to estimate the prevalence of common psychiatric disorders among persons with epilepsy (PWE) compared with those without epilepsy. The findings are expected to clarify the burden of these comorbid conditions in PWE and, in turn, inform care and management strategies and improve health-related quality of life in this population.",
                explicacao = "Estratégia semelhante ao exemplo 2."
              )
            )
          )
        ),
        explicacao = ""
      ),
      "Métodos" = list(
        partes = list(
          list(
            titulo = "Design",
            legenda = "Acordância com guideline apropriado",
            explicacao = "This systematic review and meta-analysis was performed in accordance with the Cochrane Handbook for Preferred Reporting Items for Systematic Reviews and Meta-analyses (PRISMA) reporting guidelines.",
            explicacao1 = "Declare adesão ao PRISMA."
          ),
          list(
            titulo = "Search Strategy",
            legenda = "Bases e string de busca",
            explicacao = "The research protocol was registered with PROSPERO (CRD42024531310)... [texto abreviado].",
            explicacao1 = "Reporte PROSPERO, bases, data, string e triagem."
          ),
          list(
            titulo = "Selection Criteria and Data Extraction",
            legenda = "Critérios e extração",
            explicacao = "Eligibility criteria were as follows: ... [texto abreviado].",
            explicacao1 = "Inclua/exclua + variáveis extraídas."
          ),
          list(
            titulo = "End Points and Definitions",
            legenda = "Outcomes e definições",
            explicacao = "The primary outcome was the response to treatment... [texto abreviado].",
            explicacao1 = "Liste outcomes por prioridade e subanálises."
          ),
          list(
            titulo = "Quality Assessment",
            legenda = "Risco de viés",
            explicacao = "Assessment of risk of bias ... Cochrane RoB tool ...",
            explicacao1 = "Explique instrumento e processo (revisores independentes)."
          ),
          list(
            titulo = "Statistical Analysis",
            legenda = "Programa e modelos",
            explicacao = "We used RStudio 4.3.2 with meta package ... random-effects, OR/MD/SMD, I² ...",
            explicacao1 = "Relate software, modelos e limiares."
          )
        ),
        explicacao = ""
      ),
      "Resultados" = list(partes = list(list(titulo="Resultados", legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Discussão"  = list(partes = list(list(titulo="Discussão",  legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Conclusão"  = list(partes = list(list(titulo="Conclusão",  legenda="Seu texto", explicacao="", explicacao1="")), explicacao = "")
    ),
    "The Lancet" = list(
      "Introdução" = list(partes = list(list(titulo="Introdução", legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Métodos"    = list(partes = list(list(titulo="Métodos",    legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Resultados" = list(partes = list(list(titulo="Resultados", legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Discussão"  = list(partes = list(list(titulo="Discussão",  legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Conclusão"  = list(partes = list(list(titulo="Conclusão",  legenda="Seu texto", explicacao="", explicacao1="")), explicacao = "")
    ),
    "BMJ" = list(
      "Introdução" = list(partes = list(list(titulo="Introdução", legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Métodos"    = list(partes = list(list(titulo="Métodos",    legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Resultados" = list(partes = list(list(titulo="Resultados", legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Discussão"  = list(partes = list(list(titulo="Discussão",  legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Conclusão"  = list(partes = list(list(titulo="Conclusão",  legenda="Seu texto", explicacao="", explicacao1="")), explicacao = "")
    ),
    "NEJM" = list(
      "Introdução" = list(partes = list(list(titulo="Introdução", legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Métodos"    = list(partes = list(list(titulo="Métodos",    legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Resultados" = list(partes = list(list(titulo="Resultados", legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Discussão"  = list(partes = list(list(titulo="Discussão",  legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Conclusão"  = list(partes = list(list(titulo="Conclusão",  legenda="Seu texto", explicacao="", explicacao1="")), explicacao = "")
    ),
    "Nature Medicine" = list(
      "Introdução" = list(partes = list(list(titulo="Introdução", legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Métodos"    = list(partes = list(list(titulo="Métodos",    legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Resultados" = list(partes = list(list(titulo="Resultados", legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Discussão"  = list(partes = list(list(titulo="Discussão",  legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Conclusão"  = list(partes = list(list(titulo="Conclusão",  legenda="Seu texto", explicacao="", explicacao1="")), explicacao = "")
    )
  ),
  "Carta ao Editor" = list(
    "JAMA Network" = list(
      "Contextualização" = list(partes = list(list(titulo="Contextualização", legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Argumentação"     = list(partes = list(list(titulo="Argumentação",     legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Conclusão"        = list(partes = list(list(titulo="Conclusão",        legenda="Seu texto", explicacao="", explicacao1="")), explicacao = ""),
      "Referências"      = list(partes = list(list(titulo="Referências",      legenda="Seu texto", explicacao="", explicacao1="")), explicacao = "")
    )
  )
)

# =========================================================
# PATCH: referências por exemplo (1ª parte) — cole após 'conteudo <- list(...)'
# =========================================================

## 1) SR/MA • JAMA Network • Introdução • Parte 1
refs_jama_intro <- c(
  "Author A et al. Journal 2021;10:1–10.",
  "Author B et al. Journal 2020;15:101–110.",
  "Author C et al. Journal 2019;8:50–60.",
  "Author D et al. Journal 2018;22:200–210."
)

exs <- tryCatch(
  conteudo[["Systematic Review and Meta-Analysis"]][["JAMA Network"]][["Introdução"]]$partes[[1]]$exemplos,
  error = function(e) NULL
)
if (!is.null(exs) && length(exs)) {
  n <- min(length(exs), length(refs_jama_intro))
  for (i in seq_len(n)) {
    conteudo[["Systematic Review and Meta-Analysis"]][["JAMA Network"]][["Introdução"]]$partes[[1]]$exemplos[[i]]$ref <- refs_jama_intro[i]
  }
}

## 2) Carta ao Editor • JAMA Network • Contextualização • Parte 1 (se quiser)
refs_carta_contexto <- c(
  "Autor X et al. Revista 2022;5:11–20.",
  "Autor Y et al. Revista 2021;3:21–30.",
  "Autor Z et al. Revista 2020;2:31–40.",
  "Autor W et al. Revista 2019;1:41–50."
)

exs_ce <- tryCatch(
  conteudo[["Carta ao Editor"]][["JAMA Network"]][["Contextualização"]]$partes[[1]]$exemplos,
  error = function(e) NULL
)
if (!is.null(exs_ce) && length(exs_ce)) {
  n <- min(length(exs_ce), length(refs_carta_contexto))
  for (i in seq_len(n)) {
    conteudo[["Carta ao Editor"]][["JAMA Network"]][["Contextualização"]]$partes[[1]]$exemplos[[i]]$ref <- refs_carta_contexto[i]
  }
}


# warning simples (não derruba o app)
if (!setequal(names(conteudo), c("Systematic Review and Meta-Analysis","Carta ao Editor"))) {
  warning("Atenção: nomes de topo em 'conteudo' mudaram. Ajuste dependências se necessário.")
}


# =========================================================

# =========================================================
# Tema (bslib) + estilos (navbar escura + letras verdes)
# =========================================================
app_theme <- bs_theme(
  version = 5,
  bootswatch = "flatly",
  base_font    = font_google("Inter", local = TRUE),
  heading_font = font_google("Inter", local = TRUE),
  code_font    = font_google("JetBrains Mono", local = TRUE)
)

custom_css <- HTML("
:root{ --brand-green:#213035; }

/* ---------- Gerais ---------- */
.centered-content{display:flex;flex-direction:column;align-items:center;justify-content:center;height:80vh;text-align:center}
.footer-text{font-size:.85rem;text-align:center;margin-top:30px;color:#888}
.footer-text + .footer-text{margin-top:6px}

/* Navbar escura + letras verdes */
.navbar{border-bottom:1px solid #22313f;background:#2c3e50 !important}
.navbar .navbar-brand,.navbar .nav-link{color:var(--brand-green) !important;font-weight:700}
.navbar .nav-link.active{color:var(--brand-green) !important;text-decoration:none}
.navbar-brand{display:flex;align-items:center;gap:10px;font-weight:800;letter-spacing:.2px}
.brand-name{color:var(--brand-green); font-weight:800}

/* HOVER (links normais e o ativo) */
.navbar .navbar-nav .nav-link:hover,
.navbar .navbar-nav .nav-link:focus,
.navbar .navbar-nav .nav-link.active,
.navbar .navbar-nav .nav-link.active:hover{
  color:#c8d9e0 !important;
}

/* Se estiver usando nav-underline, muda a cor da linha também */
.navbar .nav-underline .nav-link:hover,
.navbar .nav-underline .nav-link.active,
.navbar .nav-underline .nav-link.active:hover{
  border-bottom-color:#c8d9e0 !important;
}

/* (opcional) deixa o desabilitado bem cinza pra destacar o contraste */
.navbar .nav-link.disabled{ color:#55606a !important; }

.preview-wrap{ position:relative; }
.cl-example-btn{
  position:absolute; top:8px; right:8px; z-index:20;
  background:#0f172a; color:#fff; border:0; border-radius:9999px;
  padding:8px 10px; line-height:1; display:flex; align-items:center;
  box-shadow:0 4px 16px rgba(0,0,0,.15);
}
.cl-example-btn:hover{ filter:brightness(1.1); cursor:pointer; }
@media print{ .cl-example-btn{ display:none; } 
 body *{ visibility: hidden !important; }
  .a4, .a4 *{ visibility: visible !important; }
  .a4{ box-shadow: none !important; border: none !important; position: static !important; }
}

/* Assistente */
.parte-titulo{background:#eef6ff;padding:8px;border-left:4px solid #3b7a9e;margin-bottom:8px;border-radius:8px}
.explicacao-texto{font-size:.95rem;line-height:1.55}
.sidebar-sticky{position:sticky;top:12px}
.stepper{display:flex;gap:8px;flex-wrap:wrap;margin-bottom:12px}
.step{padding:6px 10px;border-radius:999px;background:#2c3e50;color:#fff;border:1px solid #0b544a}
.step.active{background:#2c3e50;color:#fff}
.exemplo-italico{font-style:italic}

/* compacto de exemplos */
.ex-compact-wrap{display:flex;align-items:center;justify-content:space-between;gap:12px;margin:6px 0}
.ex-compact-title{font-weight:700;margin:0}
.ex-compact-row{display:flex;flex-wrap:wrap;gap:6px}
.ex-chip{border-radius:999px}

/* Lista de revistas (modal da lupa) em negrito */
.rev-list li{ font-weight:800; }
.rev-list li a{ font-weight:inherit; }

/* ---------- ABSTRACTS: header com ícones ---------- */
.abs-head{display:flex;align-items:center;justify-content:space-between;margin-bottom:8px}
.abs-tools{display:flex;align-items:center;gap:8px}
.btn-circle-sm{width:34px;height:34px;border-radius:999px;display:inline-flex;align-items:center;justify-content:center;padding:0}
.abs-tools .btn{border:1px solid #e2e8f0}

/* Page Studio: botão de alerta igual ao dos Abstracts */
.ps-actions .btn-circle-sm{
  width:34px; height:34px; border-radius:9999px;
  display:inline-flex; align-items:center; justify-content:center; padding:0;
}
.ps-actions .btn-outline-warning.btn-circle-sm{
  border:1px solid #e2e8f0;
  background:#fff;    /* mesma “carinha” */
}


/* ---------- GUIA ---------- */
.guia-hero{
  position:relative; padding:48px 16px 64px;
  min-height: calc(100vh - 120px);
}
.guia-wrap{max-width:980px;margin:0 auto}
.guia-card{
  background: rgba(255,255,255,.82); backdrop-filter: blur(8px); -webkit-backdrop-filter: blur(8px);
  border:1px solid #e6ecf3; border-radius:18px; box-shadow:0 10px 30px rgba(2,6,23,.08); padding:22px 22px;
}
.guia-kicker{
  display:inline-block; font-size:.78rem; letter-spacing:.12em; text-transform:uppercase;
  background:#e6edf5; color:#54637b; font-weight:700; padding:4px 10px; border-radius:999px; margin-bottom:10px;
}
.guia-title{font-size:2.15rem;font-weight:800;margin:6px 0 10px}
.guia-sub{color:#475569;margin:0 0 18px}

/* bullets com check */
.guia-list{list-style:none;padding-left:0;margin:0}
.guia-list li{position:relative;padding-left:32px;font-size:1.05rem;font-weight:600;line-height:1.55;margin:10px 0}
.guia-list li:before{
  content:'\\2713';
  position:absolute;left:0;top:.05rem;width:22px;height:22px;border-radius:999px;
  display:inline-flex;align-items:center;justify-content:center;background:#54637b;color:#fff;font-size:.85rem;font-weight:900;
  box-shadow:0 6px 16px rgba(14,165,233,.25);
}

/* CTA */
.guia-cta{display:flex;justify-content:flex-end;margin-top:12px}
.btn-next,
.btn-success.btn-next{
  padding:10px 18px;
  border-radius:10px;
  font-weight:700;
  color:#f0f1f2 !important;
  background:#162125 !important;
  border-color:#162125 !important;
  transition: background-color .15s ease, border-color .15s ease;
}

/* muda a cor ao passar o mouse */
.btn-next:hover,
.btn-success.btn-next:hover{
  background:#577c8a !important;   /* tom para hover */
  border-color:#577c8a !important;
}

.fab-notas{
  background:#2c3e50 !important;
  border-color:#2c3e50 !important;
  color:#FFFFFB !important;
  padding:10px 14px; border-radius:12px; font-weight:700; border:0;
}
.fab-notas:hover{ filter:brightness(1.05); }



/* ---------- Cards Grupo Editorial ---------- */
.journal-card{position:relative;border:1px solid #e5e7eb;border-radius:16px;padding:14px;background:#fff;transition:transform .08s ease,box-shadow .12s ease;height:100%}
.journal-card:hover{transform:translateY(-2px);box-shadow:0 8px 26px rgba(0,0,0,.07)}
.journal-title{font-weight:800;margin-bottom:2px;display:flex;align-items:center;gap:8px}
.journal-sub{color:#6b7280;font-size:.9rem;margin-bottom:10px}
.card-actions{display:flex;align-items:center;justify-content:space-between;gap:8px}
.card-btn{width:100%}
.btn-circle{width:38px;height:38px;border-radius:999px;display:inline-flex;align-items:center;justify-content:center;border:1px solid #e2e8f0;background:#54637b}

/* ---------- Cards de exemplo (Assistente) ---------- */
.ex-list{display:flex;flex-direction:column;gap:12px}
.ex-card{position:relative;background:#ffffff;border:1px solid #e5e7eb;border-radius:14px;padding:12px 14px;box-shadow:0 4px 14px rgba(0,0,0,.04)}
.ex-card .ex-top{display:flex;align-items:center;gap:10px;margin-bottom:6px}
.ex-num{display:inline-flex;align-items:center;justify-content:center;width:28px;height:28px;border-radius:999px;background:#2c3e50;color:#fff;font-weight:800}
.ex-title{font-weight:700;margin:0}
.ex-text{margin:0}
.ex-btn{margin-top:8px}
.ex-highlight{box-shadow:0 0 0 3px #2c3e50 inset, 0 8px 24px rgba(44,62,80,.25)}

/* Título — já feito antes (.ps-title) */

/* Authors: Times New Roman 11, justificado */
.ps-authors{
  font-family: 'Times New Roman', Times, serif;
  font-size: 11pt;
  font-style: normal;
  font-weight: 400;
  text-align: justify;
  line-height: 1.35;
  white-space: pre-wrap;
  margin: 8px 0 12px;
}

/* Affiliations: Times New Roman 10, itálico, alinhado à esquerda */
.ps-aff{
  font-family: 'Times New Roman', Times, serif;
  font-size: 10pt;
  font-style: italic;
  text-align: left;
  white-space: pre-wrap;
  margin: 4px 0 12px;
}


/* ---------- FABs ---------- */
.fab-notes, .fab-connectives{
  position:fixed; right:22px;
  display:inline-flex; align-items:center; justify-content:center; gap:8px;
  height:44px; padding:0 16px;
  border:0; border-radius:12px;
  font-weight:700; font-size:14px; line-height:1;
  background:#2c3e50; color:#fff;
  box-shadow:0 10px 30px rgba(0,0,0,.2);
  z-index:1050; text-decoration:none;
}
.fab-notes{ bottom:22px; }
.fab-connectives{ bottom:78px; }
.fab-notes:hover, .fab-connectives:hover{ transform:translateY(-1px); filter:brightness(1.05); }
/* neutraliza estilos do Bootstrap que possam diferir no hover/focus */
.fab-notes.btn, .fab-connectives.btn,
.fab-notes.btn:hover, .fab-connectives.btn:hover,
.fab-notes.btn:focus, .fab-connectives.btn:focus{
  background:#2c3e50 !important; border-color:#2c3e50 !important; box-shadow:0 10px 30px rgba(0,0,0,.2);
  outline:none;
}

.modal-notes .modal-content,.modal-connectives .modal-content{border-radius:16px}
.modal-notes .modal-header,.modal-connectives .modal-header{background:#2c3e50;color:#ecf0f1;border-top-left-radius:16px;border-top-right-radius:16px}
#quick_notes{font-family:'Inter',system-ui,-apple-system,'Segoe UI',Roboto,Helvetica,Arial;border-radius:12px;min-height:230px}

/* Chips de conectivos */
.chip-wrap{display:flex;flex-wrap:wrap;gap:8px;margin:6px 0 12px}
.copy-chip{display:inline-block;border:1px solid #e2e8f0;border-radius:999px;padding:6px 10px;cursor:pointer;user-select:none;background:#fff}
.copy-chip:hover{box-shadow:0 0 0 2px #2c3e50 inset}
.cat-tip{color:#6b7280;font-size:.9rem;margin-top:-2px;margin-bottom:8px}

/* ---------- Callout texto exemplo final ---------- */
.exemplo-badge{display:inline-block;margin-bottom:6px;font-size:.8rem;font-weight:700;color:#2c3e50;background:#e6edf5;padding:2px 8px;border-radius:999px}
.exemplo-callout{position:relative;padding:14px 16px 14px 44px;border-radius:12px;background:#f3f6fa;border-left:6px solid #2c3e50;font-style:italic;color:#0f172a}
.exemplo-callout:before{content:'“';position:absolute;left:14px;top:6px;font-size:28px;line-height:1;color:#2c3e50;font-weight:700}

/* ---------- ABSTRACTS ---------- */
.abs-wrap{max-width:980px;margin:0 auto}
.abs-box{border:1px solid #e5e7eb;border-radius:14px;padding:14px;background:#fff}
.abs-meta{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:10px;margin-bottom:10px}
.abs-word{font-weight:800}
.abs-preview{white-space:pre-wrap;text-align:justify}

/* ---------- ABSTRACTS: seletor de modelo (toggle bonitão) ---------- */
.abs-toggle{
  display:flex; align-items:center; justify-content:space-between;
  width:100%; padding:12px 16px; border-radius:14px;
  background: linear-gradient(180deg,#FFFFFB 50%, #162125 100%);
  border:1px solid #577c8a; color:#577c8a; font-weight:700; letter-spacing:.2px;
  box-shadow:0 6px 14px rgba(2,6,23,.06); 
  transition: transform .06s ease, box-shadow .18s ease, background .18s ease, border-color .18s ease;
}
.abs-toggle:hover{
  background:#e9f2ff; border-color:#1b282d; transform:translateY(-1px);
  box-shadow:0 10px 24px rgba(2,6,23,.08);
}
.abs-toggle:focus{ outline:none; box-shadow:0 0 0 3px rgba(14,165,233,.35); }
.abs-toggle .abs-toggle-left{ display:flex; align-items:center; gap:10px; }
.abs-toggle .abs-toggle-right{ display:inline-flex; transition: transform .18s ease; }
.abs-toggle[aria-expanded='true'] .abs-toggle-right{ transform: rotate(180deg); }


/* ---------- PAGE STUDIO ---------- */
.a4{width:210mm;min-height:297mm;margin:0 auto;background:#fff;padding:20mm;border:1px solid #e5e7eb;border-radius:10px;box-shadow:0 10px 30px rgba(0,0,0,.12)}
.a4 h1,.a4 h2,.a4 h3{margin:0 0 6px}
.a4 hr{margin:8px 0}
.ps-fields .form-group{margin-bottom:10px}
.a4{
  width:210mm; min-height:297mm; margin:0 auto; background:#fff; padding:20mm;
  border:1px solid #e5e7eb; border-radius:10px; box-shadow:0 10px 30px rgba(0,0,0,.12);
  position:relative; /* <- adiciona isto para ancorar o rodapé corretamente */
}

/* ---- Escala da prévia A4 (mantém proporção) ---- */
.a4-view { width: calc(210mm * .82); margin: 0 auto; }
.a4-view .a4 { transform: scale(.82); transform-origin: top left; }

/* Na impressão, volta para 100% (sem escala) */
@media print{
  .a4-view { width: auto; }
  .a4-view .a4 { transform: none; }
}

/* Título da prévia A4 */
.a4 .ps-title{
  font-family:'Times New Roman', Times, serif !important;
  font-size:12pt !important;
  font-weight:700 !important;   /* bold */
  text-align:center !important;
  margin:0 0 8px;
}

/* posiciona bloco no rodapé da página A4 */
.a4{ position: relative; }

/* bloco 'Corresponding author' */
.ps-corr{ 
  font-family: 'Times New Roman', Times, serif;
  font-size: 11pt;
  text-align: left;
  line-height: 1.35;
}
.ps-corr p{ margin: 0; }
.ps-corr .lbl{ font-weight: 700; }  /* só o rótulo em bold */
.ps-corr-block{ position: absolute; left: 20mm; right: 20mm; bottom: 32mm; } /* 4 linhas de baixo pra cima */
.ps-corr-row{ display: flex; flex-wrap: wrap; gap: 36px; }          /* telef./address na MESMA linha */


/* ---------- PRISMA (SVG) ---------- */
.prisma-btns{display:flex;gap:8px;align-items:center}
.prisma-note{font-size:.9rem;color:#475569}

/* SVG em tela: ocupa 100% do contêiner e sem moldura */
.prisma-svg{
  display:block;
  width:100%;
  height:auto;
  border:none;
  background:transparent;
  box-shadow:none;
  border-radius:0;
}

/* impressão: só o SVG visível, sem bordas/sombra */
@media print{
  body *{visibility:hidden}
  .prisma-svg, .prisma-svg *{visibility:visible}
  .prisma-svg{box-shadow:none;border:none}
}

/* -------- PRISMA (layout novo) -------- */
/* contêiner do flow + grid com a MESMA largura (1100px) */
.prisma-page{ max-width:1100px; margin:0 auto; padding:0 0 12px; }
.prisma-flow{ max-width:1100px; margin:0 auto 12px; }
.prisma-grid{
  max-width:1100px;
  margin:0 auto;
  display:grid;
  grid-template-columns:repeat(3, minmax(0,1fr));
  gap:12px;
}

/* cartões das 3 colunas */
.prisma-col{
  background:#fff;
  border:1px solid #e5e7eb;
  border-radius:12px;
  padding:12px;
}

/* ajustes finos */
.prisma-grid h5{ margin-top:0; }

/* responsivo: empilha as 3 colunas */
@media (max-width: 992px){
  .prisma-grid{ grid-template-columns:1fr; }
}
")
# ===== HEAD (deve vir APÓS custom_css/custom_palette_overrides) =====
ui_head <- tags$head(
  tags$style(custom_css),
  tags$style(custom_palette_overrides),
  
  # correções pontuais necessárias agora
  tags$style(HTML("
    /* Esconde a folha A4 global e mostra só dentro do Page Studio */
    .a4 { display: none; }
    #page_preview .a4 { display: block; }

    /* Ajustes visuais rápidos */
    .logo-inicio{ display:block; margin:0 auto 24px; max-width:160px; height:auto; }
    .centered-content{
      display:flex; flex-direction:column; align-items:center; justify-content:center;
      min-height:60vh; text-align:center;
    }
  "))
)


# --- Paleta + overrides mínimos (apenas cor) ---
custom_palette_overrides <- HTML("
/* ========= TOKENS ========= */
:root{
   --bg: #e6e8e9;

  /* Texto */
  --ink-strong: #211E55;   /* títulos/links/navbar */
  --ink:        #2A2A2A;   /* corpo de texto */
  --ink-muted:  #58567E;   /* subtítulos */
  --ink-subtle: #908EA8;   /* metadados */

  /* Superfícies/linhas */
  --surface-0:   #daddde;
  --surface-100: #e1e3e4;
  --surface-200: #e9eaeb;
  --surface-300: #f0f1f2;
  --line:        #b6bbbd;
  --line-subtle: #b6bbbd;

  /* Ações */
  --action:        #213035;
  --action-hover:  #727c7f;
  --action-active: #485559;
  --action-on:     #eef9fd;

  /* Navbar/links */
  --nav:         #162125;
  --nav-hover:   #1b282d;
  --nav-active:  #577c8a;
  --link:        #213035;
  --link-hover:  #213035;

  /* Acessibilidade */
  --focus-ring: rgba(88,86,126,.35);
}

/* ========= BASE ========= */
html, body{ background:var(--bg); color:var(--ink); }
a{ color:var(--link); }
a:hover{ color:var(--link-hover); }

/* ========= NAVBAR ========= */
.navbar{
  background:var(--nav) !important;
  border-bottom:1px solid var(--action);
}
.navbar .navbar-brand, .navbar .nav-link{ color:var(--surface-0) !important; font-weight:700; }
.navbar .nav-link:hover{ color:var(--nav-hover) !important; }
.navbar .nav-link.active{ color:var(--surface-0) !important; }
.brand-name{ color:var(--surface-0); font-weight:800; }

/* ========= SUPERFÍCIES ========= */
.well, .panel, .card, .modal-content,
.journal-card, .ex-card, .abs-box, .ps-card, .pr-card{
  background:var(--surface-0);
  color:var(--ink);
  border:1px solid var(--line);
}

/* ========= TIPOGRAFIA ========= */
h1, h2, h3, h4, h5, h6{ color:var(--ink-strong); }
.footer-text{ color:var(--ink-subtle); }

/* ========= BOTÕES ========= */
.btn{ border-radius:10px; font-weight:700; }
.btn-primary{
  background:var(--action); border-color:var(--action); color:var(--action-on);
}
.btn-primary:hover{ background:var(--action-hover); border-color:var(--action-hover); }
.btn-primary:active{ background:var(--action-active); border-color:var(--action-active); }
.btn-outline-secondary{
  color:var(--ink-strong); border-color:var(--line); background:transparent;
}
.btn-outline-secondary:hover{
  background:var(--surface-100); border-color:var(--line);
}

/* ========= INPUTS ========= */
.form-control, textarea.form-control, input.form-control{
  background:var(--surface-0); color:var(--ink);
  border:1px solid var(--line);
}
.form-control::placeholder{ color:var(--ink-subtle); opacity:.95; }
.form-control:focus{
  border-color:var(--ink-muted);
  box-shadow:0 0 0 .2rem var(--focus-ring);
}

/* ========= CHIPS / BADGES / CALLOUTS ========= */
.copy-chip{
  background:var(--surface-0); color:var(--ink);
  border:1px solid var(--line); border-radius:999px; font-weight:600;
}
.copy-chip:hover{ box-shadow:0 0 0 2px var(--nav) inset; }

.exemplo-badge{
  background:var(--nav); color:var(--surface-0);
  font-weight:700; border-radius:999px;
}
.exemplo-callout{
  background:var(--surface-100); color:#0F172A;
  border-left:6px solid var(--nav);
}
")

# =========================================
# UI (tabs)
# =========================================
app_ui <- tagList(
  ui_head,  
  navbarPage(
    title = tags$div(
      class = "brand-wrap",
      span(class = "brand-name", "Redactum")
    ),
    id = "main_tabs",
    theme = app_theme,
    
    # ---------- ABAS ----------
    tabPanel(
      "Início", value = "inicio",
      fluidPage(
        div(class = "centered-content",
            tags$img(
              src = "logoapp.png",
              class = "logo-inicio",
              alt = "Logo Redactum"
            ),
            h1("Redactum"),
            br(),
            h4(
              "Olá! Esta ferramenta foi criada para auxiliar ",
              tags$strong("Brasileiros"),
              " na escrita de textos científicos de alto impacto."
            ),
            h5("Para começar, clique em \"Iniciar\" e leia as instruções."),
            actionButton(
              "start_btn", "Iniciar",
              class = "btn btn-primary",
              style = "margin-top:18px;",
              title = "Ir para guia"
            ),
            div(class = "footer-text", "Created and owned by Artur Menegaz de Almeida")
        )
      )
    ),
    
    tabPanel(
      "Guia",
      fluidPage(
        div(class="guia-hero",
            div(class="guia-wrap",
                div(class="guia-card",
                    span(class="guia-kicker","Antes de tudo"),
                    h2(class="guia-title","Como usar o Redactum?"),
                    p(class="guia-sub","Para otimizar a execução de seu artigo, siga esse passo-a-passo:"),
                    tags$ul(class="guia-list",
                            tags$li("1º - Escolha a revista onde você pretende publicar seu artigo, analisando prós e contras."),
                            tags$li("2º - Cheque e o grupo editorial que publica sua revista de interesse."),
                            tags$li("3º - Monte sua Title Page na aba ferramentas complementares, e a abra em Words/Docs."),
                            tags$li("4º - Escreva seu artigo com o Assistente de Escrita escolhido, transferindo-o para o documento da Title Page."),
                            tags$li("5º - Escreva sua cover letter, prepare os arquivos para submissão e submeta seu trabalho!.")
                    ),
                    div(class="guia-cta",
                        actionButton("go_to_grupos","Próximo", class="btn btn-success btn-next", title="Ir para Menu")
                    )
                )
            )
        )
      )
    ),
    
    tabPanel(
      "Menu",
      fluidPage(
        br(),
        h3("Selecione o Grupo Editorial que publica sua revista de interesse"),
        p("Sua escolha definirá o estilo e as instruções do Assistente de Escrita."),
        uiOutput("revistas_botoes"),
        
        tags$hr(),
        h3("Ferramentas complementares"),
        p("Atalhos para utilidades que aceleram sua submissão."),
        
        fluidRow(
          column(
            width = 4,
            div(class="journal-card",
                div(class="journal-title", icon("file-lines"), "Abstracts"),
                div(class="journal-sub", "Gerador de abstracts estruturados com contador de palavras."),
                div(class="card-actions",
                    actionButton("go_abs", "Abrir Abstracts",
                                 class="btn btn-primary card-btn",
                                 title = "Ir para Abstracts"),
                    actionButton("info_abs", label = NULL, icon = icon("search"),
                                 class = "btn-circle", title = "O que é?")
                )
            )
          ),
          column(
            width = 4,
            div(class="journal-card",
                div(class="journal-title", icon("signature"), "Title Page"),
                div(class="journal-sub", "Monte a capa de seu manuscrito ou sua cover letter."),
                div(class="card-actions",
                    actionButton("go_page_studio", "Abrir Title Page",
                                 class="btn btn-primary card-btn",
                                 title = "Ir para Page Studio"),
                    actionButton("info_page", label = NULL, icon = icon("search"),
                                 class = "btn-circle", title = "O que é?")
                )
            )
          ),
          column(
            width = 4,
            div(class="journal-card",
                div(class="journal-title", icon("sitemap"), "PRISMA Flow Diagram"),
                div(class="journal-sub", "Monte seu PRISMA Flow Diagram."),
                div(class="card-actions",
                    actionButton("go_prisma", "Abrir PRISMA Flow",
                                 class="btn btn-primary card-btn",
                                 title = "Ir para PRISMA Flow Diagram"),
                    actionButton("info_prisma", label = NULL, icon = icon("search"),
                                 class = "btn-circle", title = "O que é?")
                )
            )
          )
        )
      )
    ),
    
    tabPanel(
      "Assistente de Escrita",
      div(
        id = "assistente-pane",
        fluidPage(
          rclipboardSetup(),
          sidebarLayout(
            sidebarPanel(
              class = "sidebar-sticky",
              uiOutput("journal_badge"),
              selectInput("tipo_estudo", "Tipo de Estudo:", choices = names(conteudo)),
              uiOutput("secao_ui"),
              hr(),
              uiOutput("stepper"),
              uiOutput("progresso"),
              uiOutput("nav_buttons"),
              hr(),
              wellPanel(
                h4("Checklist de Formatação"),
                checkboxGroupInput("formatting_checklist",
                                   "Ao transcrever seu texto para o Word/Docs, essa é a forma mais adequada:",
                                   choices = list(
                                     "Fonte: Times New Roman"         = "font_tnr",
                                     "Tamanho: 12 - Títulos"          = "font_size_titles",
                                     "Tamanho: 11 - Corpo do texto"   = "font_size_body",
                                     "Parágrafos: Justificados"       = "paragraph_justified",
                                     "Instituições: Itálico"          = "institutions_italic",
                                     "Títulos: Negrito"               = "titles_bold"
                                   )
                )
              )
            ),
            mainPanel(
              h3("Escrevendo seu texto"),
              uiOutput("titulo_parte"),
              checkboxInput("modo_compacto", "Ocultar caixas de exemplos", value = FALSE),
              uiOutput("explicacoes"),
              uiOutput("copy_buttons_exemplo"),
              uiOutput("refs_simples")  # refs + texto final + copiar
            )
          ),
          # FABs
          actionButton("open_connectives", "\U0001F4D6 Conectivos",
                       class = "fab-connectives", title = "Conectivos úteis (clique para inserir)"),
          actionButton("open_notes", "✎ Notas",
                       class = "fab-notes", title = "Notas rápidas")
        )
      )
    ),
    
    tabPanel(
      "Abstracts",
      fluidPage(
        rclipboardSetup(),
        div(class="abs-wrap",
            br(), h3("Gerador de Abstracts"),
            
            # ---------- Botão retrátil + opções ----------
            div(class="abs-box",
                tags$button(
                  id = "abs_toggle",
                  class = "abs-toggle",
                  type = "button",
                  `data-bs-toggle` = "collapse",
                  `data-bs-target` = "#abs_opts",
                  `aria-expanded` = "false",
                  tags$span(class = "abs-toggle-left",
                            icon("sliders"),
                            "Selecionar estilo"),
                  tags$span(class = "abs-toggle-right", icon("chevron-down"))
                ),
                div(id="abs_opts", class="collapse",
                    br(),
                    radioButtons(
                      "abs_model", label = NULL,
                      choices = c(
                        "Abstract genérico" = "GEN",
                        "JAMA" = "JAMA",
                        "Elsevier" = "LANCET",
                        "Lippincott" = "NEJM",
                        "Springer" = "NATMED",
                        "Taylor & Francis" = "BMJLIKE",
                        "Wiley" = "WILEY",
                        "Case report" = "CASE"
                      ),
                      selected = "GEN"
                    ),
                    div(style="margin-top:-6px;color:#6b7280",
                        "Ao escolher, os tópicos são colados na caixa abaixo.")
                )
            ),
            
            br(),
            
            # ---------- Caixa única ----------
            div(class="abs-box",
                div(class = "abs-head",
                    h4("Abstract"),
                    div(class = "abs-tools",
                        span(id = "abs_wc", "0 palavras"),
                        # Aviso fixo (guidelines)
                        tags$button(
                          id = "abs_warn_btn", type = "button",
                          class = "btn btn-outline-warning btn-circle-sm",
                          `data-bs-toggle` = "popover", `data-bs-trigger` = "focus",
                          `data-bs-placement` = "bottom", `data-bs-html` = "true",
                          `data-bs-title` = "Atenção",
                          `data-bs-content` =
                            "Sempre confirme as <b>guidelines</b> da revista alvo para formato, limites e seções do abstract.",
                          icon("triangle-exclamation")
                        ),
                        # Exemplo dinâmico
                        tags$button(
                          id = "abs_example_btn", type = "button",
                          class = "btn btn-outline-secondary btn-circle-sm",
                          `data-bs-toggle` = "popover", `data-bs-trigger` = "focus",
                          `data-bs-placement` = "bottom", `data-bs-html` = "true",
                          `data-bs-title` = "Exemplo",
                          `data-bs-content` = "TEXTOABSTRACT",
                          icon("search")
                        )
                    )
                ),
                textAreaInput(
                  "abs_text", label = NULL, value = "",
                  width = "100%", height = "65vh",
                  placeholder = "Seu abstract aparecerá aqui com os tópicos do estilo escolhido!"
                ),
                br(),
                uiOutput("abs_copy_ui")
            ),
            
            br(),
            
            # ---------- Inserções rápidas ----------
            div(class="abs-box",
                h5("Inserções rápidas (pressione Enter para colar no abstract)"),
                fluidRow(
                  column(6,
                         div(class="form-group",
                             tags$label("Funding information"),
                             tags$input(id="abs_funding", type="text",
                                        class="form-control abs-meta-field",
                                        `data-meta-type`="funding",
                                        placeholder="Ex.: This research received no funding")
                         )
                  ),
                  column(6,
                         div(class="form-group",
                             tags$label("Conflicts of interest"),
                             # ATENÇÃO: deixe 'data-meta-type' = "trial" para casar com o server
                             tags$input(id="abs_trial", type="text",
                                        class="form-control abs-meta-field",
                                        `data-meta-type`="trial",
                                        placeholder="Ex.: The authors declare no conflicts of interest.")
                         )
                  )
                ),
                fluidRow(
                  column(6,
                         div(class="form-group",
                             tags$label("Data availability"),
                             tags$input(id="abs_data", type="text",
                                        class="form-control abs-meta-field",
                                        `data-meta-type`="data",
                                        placeholder="Ex.: Data available on reasonable request")
                         )
                  ),
                  column(6,
                         div(class="form-group",
                             tags$label("Ethics approval"),
                             tags$input(id="abs_ethics", type="text",
                                        class="form-control abs-meta-field",
                                        `data-meta-type`="ethics",
                                        placeholder="Ex.: Approved by XYZ IRB (#2024-001)")
                         )
                  )
                ),
                div(style="color:#6b7280;margin-top:6px;",
                    "preencha um campo e pressione Enter para inserir em seu abstract.")
            )
        )
      )
    ),
    
    tabPanel(
      "Page Studio",
      fluidPage(
        uiOutput("pages_ui")
      )
    ),
    
    tabPanel(
      "PRISMA Flow Diagram",
      fluidPage(
        uiOutput("prisma_ui")
      )
    )
  )  # <-- fecha navbarPage(
)    # <-- fecha tagList(

# =========================================
# Server
# =========================================

server <- function(input, output, session){
  
  observeEvent(input$start_btn,    { updateTabsetPanel(session, "main_tabs", "Guia") })
  observeEvent(input$go_to_grupos, { updateTabsetPanel(session, "main_tabs", "Menu") })
  
  observeEvent(input$go_page_studio, {
    updateTabsetPanel(session, "main_tabs", "Page Studio")
  })
  
  observeEvent(input$info_page, {
    showModal(modalDialog(
      title = tags$strong("Title Page"),
      p("Preencha os campos com seus dados e gere sua title page ou sua cover letter de forma prática."),
      easyClose = TRUE, size = "m"
    ))
  })
  
  # --- ALTERAR: botão de copiar o abstract ---
  output$abs_copy_ui <- renderUI({
    rclipboard::rclipButton(
      inputId  = "abs_copy",
      label    = "Copiar abstract",
      clipText = input$abs_text %||% "",
      icon     = icon("copy"),
      class    = "btn btn-outline-secondary"
    )
  })
  
  
  # --- Copiar seção (Assistente de Escrita) ---
  output$copy_buttons_exemplo <- renderUI({
    secs <- secoes_atual(); if (length(secs) == 0) return(NULL)
    secao  <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    n_parts <- if (!is.null(partes)) length(partes) else 0
    if (n_parts > 0 && parte_index() <= n_parts) {
      div(style = "margin:10px 0 18px;",
          rclipboard::rclipButton(
            inputId  = "copiar_secao",
            label    = "Copiar seção",
            clipText = {
              t <- texto_secao_atual()      # <<— pega o texto da seção
              t <- gsub("\r?\n+", " ", t)   # troca quebras por espaço
              t <- gsub("[ \t]{2,}", " ", t)
              trimws(t)
            },
            icon     = icon("copy"),
            class    = "btn btn-outline-secondary"
          )
      )
    } else NULL
  })
  
  # feedback visual ao clicar em copiar
  observeEvent(input$abs_copy, ignoreInit = TRUE, {
    session$sendCustomMessage("savedToast", list(text = "Abstract copiado!"))
  })
  
  
  grupos <- c("JAMA Network","Elsevier","Lippincott","Springer Nature","Taylor & Francis","Wiley")
  
  grupos_revistas <- list(
    "JAMA Network" = data.frame(
      nome = c("JAMA - 55.00","JAMA Internal Medicine - 23.30","JAMA Neurology - 21.30","JAMA Oncology - 20.10",
               "JAMA Pediatrics - 18.00","JAMA Psychiatry - 17.10","JAMA Surgery - 14.90","JAMA Cardiology - 14.10",
               "JAMA Health Forum - 11.30","JAMA Dermatology - 11.00","JAMA Network Open - 9.70",
               "JAMA Ophthalmology - 9.20","JAMA Otolaryngology - 5.60"),
      url = rep(NA_character_, 13)
    ),
    "Elsevier" = data.frame(
      nome = c("The Lancet - 88.50","The Lancet Neurology - 45.50","Cancer Cell - 44.50","Cell - 42.50",
               "The Lancet Gastroenterology & Hepatology - 38.60","The Lancet Oncology - 35.90",
               "Journal of Hepatology - 33.00","The Lancet Respiratory Medicine - 32.80",
               "The Lancet Infectious Diseases - 31.00","Immunity - 26.30"),
      url = rep(NA_character_, 10)
    ),
    "Lippincott" = data.frame(
      nome = c("Circulation - 36.00","Circulation Research - 20.30","Anesthesiology - 9.30","Stroke - 9.30",
               "Neurology - 8.70","Hypertension - 8.20","ATVB - 7.40","Critical Care Medicine - 6.00",
               "Annals of Surgery - 6.40","Obstetrics & Gynecology - 4.70"),
      url = rep(NA_character_, 10)
    ),
    "Springer Nature" = data.frame(
      nome = c("Nature Reviews Clinical Oncology - 82.20","Nature Reviews Cancer - 66.80",
               "Nature Reviews Disease Primers - 60.60","Nature Reviews Gastroenterology & Hepatology - 51.00",
               "Nature Medicine - 50.00","Nature Reviews Cardiology - 44.20",
               "Nature Reviews Endocrinology - 40.00","Nature Reviews Nephrology - 39.80","Nature Reviews Neurology - 33.10"),
      url = rep(NA_character_, 9)
    ),
    "Taylor & Francis" = data.frame(
      nome = c("The American Journal of Bioethics - 20.80","Drug Delivery - 8.10","mAbs - 7.30",
               "Expert Opinion on Drug Delivery - 6.90","Critical Reviews in BMB - 6.20",
               "Critical Reviews in Microbiology - 6.00","Expert Review of Vaccines - 4.80",
               "Expert Opinion on Therapeutic Patents - 4.60","Expert Opinion on Investigational Drugs - 4.40",
               "Annals of Medicine - 4.30"),
      url = rep(NA_character_, 10)
    ),
    "Wiley" = data.frame(
      nome = c("A Cancer Journal for Clinicians - 232.40","World Psychiatry - 65.8","Hepatology - 15.80",
               "Allergy - 12.00","Alzheimer's & Dementia - 11.10", "Arthritis & Rheumatology - 10.90", "European Journal of Heart Failure - 10.80", "American Journal of Hematology - 9.90", "Cochrane Database of Systematic Reviews - 9.40", "British Journal of Dermatology - 9.30"),
      url = rep(NA_character_, 10)
    )
  )
  
  revista_escolhida <- reactiveVal("JAMA Network")
  
  output$revistas_botoes <- renderUI({
    fluidRow(lapply(seq_along(grupos), function(i){
      column(width = 4,
             div(class="journal-card",
                 div(class="journal-title", icon("layer-group"), grupos[i]),
                 div(class="journal-sub", "Clique para aplicar o estilo ao Assistente de Escrita"),
                 div(class="card-actions",
                     actionButton(paste0("revista_", i), "Selecionar", class="btn btn-primary card-btn",
                                  title = paste("Selecionar", grupos[i])),
                     actionButton(paste0("grupo_info_", i), label = NULL, icon = icon("search"),
                                  class = "btn-circle", title = "Revistas de maior IF")
                 )
             )
      )
    }))
  })
  
  lapply(seq_along(grupos), function(i){
    observeEvent(input[[paste0("grupo_info_", i)]], {
      grp  <- grupos[i]
      revs <- grupos_revistas[[grp]]
      if (is.null(revs) || nrow(revs) == 0) {
        revs <- data.frame(nome="(Adicione as revistas deste grupo em 'grupos_revistas')", url=NA_character_)
      } else if (is.null(revs$url)) {
        revs$url <- rep(NA_character_, nrow(revs))
      }
      lista <- tags$ul(
        class = "rev-list",
        lapply(seq_len(nrow(revs)), function(k){
          nome <- revs$nome[k]; url <- revs$url[k]
          if (is.na(url) || !nzchar(url)) {
            tags$li(nome)
          } else {
            tags$li(tags$a(href=url, target="_blank", nome))
          }
        })
      )
      showModal(modalDialog(title = tags$strong(paste("Revistas de maior IF —", grp)),
                            lista, easyClose = TRUE, size = "l"))
    })
  })
  
  lapply(seq_along(grupos), function(i){
    observeEvent(input[[paste0("revista_", i)]], {
      revista_escolhida(grupos[i])
      updateTabsetPanel(session, "main_tabs", "Assistente de Escrita")
    })
  })
  
  estilo_aplicado <- reactive({
    grp <- revista_escolhida()
    est <- c("JAMA Network"="JAMA Network","Elsevier"="The Lancet","Lippincott"="NEJM",
             "Springer Nature"="Nature Medicine","Taylor & Francis"="BMJ","Wiley"="BMJ")[grp]
    if (is.null(est) || !nzchar(est)) est <- "JAMA Network"
    est
  })
  
  output$journal_badge <- renderUI({
    tags$div(
      style="padding:8px; background:#eef6ff; border-left:4px solid #3b7a9e; margin-bottom:8px; border-radius:8px;",
      tags$div(tags$strong("Grupo selecionado: "), revista_escolhida())
    )
  })
  
  secao_index <- reactiveVal(1)
  parte_index <- reactiveVal(1)
  valores <- reactiveValues(textos = list())
  
  secoes_atual <- reactive({
    tipo <- input$tipo_estudo
    est  <- estilo_aplicado()
    if (is.null(tipo) || is.null(est)) return(character(0))
    names(conteudo[[tipo]][[est]])
  })
  
  output$secao_ui <- renderUI({
    secs <- secoes_atual()
    if (length(secs) == 0) return(NULL)
    selectInput("secao", "Seção do Artigo:", choices = secs, selected = secs[1])
  })
  
  observeEvent(list(input$tipo_estudo, estilo_aplicado()), {
    secs <- secoes_atual()
    if (length(secs) > 0) {
      secao_index(1); parte_index(1)
      updateSelectInput(session, "secao", choices = secs, selected = secs[1])
    }
  })
  
  observeEvent(input$secao, {
    secs <- secoes_atual()
    idx <- which(secs == input$secao)
    if (length(idx) == 1) { secao_index(idx); parte_index(1) }
  })
  
  output$stepper <- renderUI({
    tipo <- input$tipo_estudo; if (is.null(tipo) || !nzchar(tipo)) tipo <- "—"
    grp  <- revista_escolhida(); if (is.null(grp)  || !nzchar(grp))  grp  <- "—"
    secs <- secoes_atual()
    sec  <- if (length(secs) >= secao_index()) secs[secao_index()] else "—"
    div(class="stepper",
        span(class="step active", tipo),
        span(class="step active", grp),
        span(class="step", sec))
  })
  
  output$titulo_parte <- renderUI({
    secs <- secoes_atual(); if (length(secs) == 0) return(NULL)
    secao <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    n_parts <- if (!is.null(partes)) length(partes) else 0
    if (n_parts == 0 || parte_index() > n_parts) return(NULL)
    parte <- partes[[parte_index()]]
    tagList(h4(parte$legenda), h4(strong(parte$titulo)))
  })
  
  exemplos_reactive <- reactive({
    secs <- secoes_atual()
    if (length(secs) == 0) return(list(text = character(0), expl = character(0)))
    secao  <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    parte  <- if (!is.null(partes) && parte_index() <= length(partes)) partes[[parte_index()]] else NULL
    if (is.null(parte)) return(list(text = character(0), expl = character(0)))
    
    if (!is.null(parte$exemplos) && length(parte$exemplos) > 0) {
      txts <- vapply(parte$exemplos, function(x) x$texto,      FUN.VALUE = character(1))
      exps <- vapply(parte$exemplos, function(x) x$explicacao, FUN.VALUE = character(1))
      return(list(text = txts, expl = exps))
    }
    txt <- if (!is.null(parte$explicacao))  parte$explicacao  else character(0)
    exp <- if (!is.null(parte$explicacao1)) parte$explicacao1 else character(0)
    list(text = if (length(txt)) txt else character(0),
         expl = if (length(exp)) exp else rep("", length(txt)))
  })
  
  output$explicacoes <- renderUI({
    secs <- secoes_atual(); if (length(secs) == 0) return(NULL)
    secao  <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    n_parts <- if (!is.null(partes)) length(partes) else 0
    if (n_parts == 0 || parte_index() > n_parts) return(NULL)
    
    exs <- exemplos_reactive()
    n <- length(exs$text)
    
    painel_aluno <- wellPanel(
      h4("Seu Texto"),
      textAreaInput(
        "texto_aluno", label = NULL,
        value = {
          secao <- secs[secao_index()]
          key <- paste(input$tipo_estudo, estilo_aplicado(), secao, parte_index(), sep = "||")
          isolate(if (!is.null(valores$textos[[key]])) valores$textos[[key]] else "")
        },
        width = "100%", height = "180px"
      ),
      div(style = "margin-top:8px;", actionButton("salvar_texto", "Salvar", class = "btn btn-primary"))
    )
    
    if (isTRUE(input$modo_compacto)) {
      botoes <- lapply(seq_len(n), function(i){
        div(class = "btn-group",
            actionButton(paste0("abrir_ex_", i), paste("Exemplo", i), class = "btn btn-secondary btn-sm ex-chip"),
            actionButton(paste0("explica_", i), "Ver explicação", class = "btn btn-outline-secondary btn-sm"))
      })
      barra <- wellPanel(div(class="ex-compact-wrap",
                             h5(class="ex-compact-title","Selecione"),
                             div(class="ex-compact-row", botoes)))
      tagList(painel_aluno, barra)
    } else {
      cards <- lapply(seq_len(n), function(i){
        div(class="ex-card", id = paste0("excard_", i),
            div(class="ex-top", span(class="ex-num", i), h5(class="ex-title", paste0("Exemplo ", i))),
            p(class="ex-text exemplo-italico", exs$text[i]),
            actionButton(paste0("explica_", i), "Ver explicação", class="btn btn-outline-secondary btn-sm ex-btn"))
      })
      esquerda <- wellPanel(div(class="ex-list", cards))
      tagList(esquerda, painel_aluno)
    }
  })
  
  lapply(1:12, function(i){
    observeEvent(input[[paste0("abrir_ex_", i)]], {
      exs <- exemplos_reactive()
      if (i <= length(exs$text)) {
        showModal(modalDialog(
          title = tags$strong(paste("Exemplo", i)),
          tags$p(class = "exemplo-italico", exs$text[i]),
          easyClose = TRUE, size = "m", footer = modalButton("Fechar")
        ))
      }
    }, ignoreInit = TRUE)
  })
  lapply(1:12, function(i){
    observeEvent(input[[paste0("explica_", i)]], {
      exs <- exemplos_reactive()
      if (i <= length(exs$expl)) {
        showModal(modalDialog(
          title = tags$strong(paste("Explicação — Exemplo", i)),
          div(class="explicacao-texto", exs$expl[i]),
          easyClose = TRUE, size = "m", footer = modalButton("Fechar")
        ))
        session$sendCustomMessage("highlightCard", list(id = paste0("excard_", i)))
      }
    }, ignoreInit = TRUE)
  })
  
  txt_deb <- shiny::debounce(reactive({ if (is.null(input$texto_aluno)) "" else input$texto_aluno }), 250)
  observeEvent(txt_deb(), {
    txt <- txt_deb(); if (is.null(txt)) return(NULL)
    secs <- secoes_atual(); if (length(secs) == 0) return(NULL)
    secao <- secs[secao_index()]
    key <- paste(input$tipo_estudo, estilo_aplicado(), secao, parte_index(), sep = "||")
    valores$textos[[key]] <- txt
  }, ignoreInit = TRUE)
  
  output$progresso <- renderUI({
    secs <- secoes_atual(); if (length(secs) == 0) return(NULL)
    secao <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    if (is.null(partes)) return(NULL)
    total <- length(partes)
    h5(paste("Parte", parte_index(), "de", total + 1))
  })
  
  output$nav_buttons <- renderUI({
    secs <- secoes_atual(); if (length(secs) == 0) return(NULL)
    secao <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    n_parts <- if (!is.null(partes)) length(partes) else 0
    if (n_parts == 0) return(NULL)
    prev_disabled <- (parte_index() <= 1)
    next_disabled <- (parte_index() >= (n_parts + 1))
    tagList(
      tags$div(style = "margin-bottom:8px;",
               tags$button(id = "prev_parte", type = "button", class = "btn action-button",
                           disabled = if (prev_disabled) "disabled" else NULL, "Anterior", title = "Parte anterior"),
               " ",
               tags$button(id = "next_parte", type = "button", class = "btn action-button",
                           disabled = if (next_disabled) "disabled" else NULL, "Próximo", title = "Próxima parte")
      )
    )
  })
  
  # helper p/ pegar um valor (primeiro não-nulo)
  or_else <- function(...) { for (x in list(...)) if (!is.null(x)) return(x); NULL }
  
  # helper de card
  ref_card <- function(nome){
    div(class="ref-card",
        div(class="ref-title","Estilo de referência"),
        div(class="ref-sub", nome))
  }
  
  observeEvent(input$next_parte, {
    secs <- secoes_atual(); if (length(secs) == 0) return(NULL)
    secao <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    n_parts <- if (!is.null(partes)) length(partes) else 0
    if (n_parts > 0 && parte_index() < (n_parts + 1)) parte_index(parte_index() + 1)
  })
  observeEvent(input$prev_parte, { if (parte_index() > 1) parte_index(parte_index() - 1) })
  
  output$texto_final_exemplo <- renderUI({
    secs <- secoes_atual(); if (length(secs) == 0) return(NULL)
    secao <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    n_parts <- if (!is.null(partes)) length(partes) else 0
    if (n_parts == 0 || parte_index() <= n_parts) return(NULL)
    wellPanel(
      tags$div(class="exemplo-badge","Texto Exemplo"),
      tags$div(class="exemplo-callout","Use as instruções da seção para compor seu parágrafo final.")
    )
  })
  
  output$texto_final_aluno <- renderUI({
    secs <- secoes_atual(); if (length(secs) == 0) return(NULL)
    secao <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    n_parts <- if (!is.null(partes)) length(partes) else 0
    if (n_parts == 0 || parte_index() <= n_parts) return(NULL)
    keys <- sapply(seq_len(n_parts), function(i) paste(input$tipo_estudo, estilo_aplicado(), secao, i, sep = "||"))
    comp <- vapply(keys, function(k) if (!is.null(valores$textos[[k]])) valores$textos[[k]] else "", FUN.VALUE = character(1))
    texto_compilado <- paste(comp[nchar(comp) > 0], collapse = " ")
    wellPanel(h4("Texto Final do Aluno"), tags$p(texto_compilado, id="texto_final_secao", style = "text-align: justify;"))
  })
  
  output$copy_buttons_final <- renderUI({
    secs <- secoes_atual(); if (length(secs) == 0) return(NULL)
    secao  <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    n_parts <- if (!is.null(partes)) length(partes) else 0
    if (n_parts == 0 || parte_index() <= n_parts) return(NULL)
    
    # texto corrido para a área de transferência
    txt <- texto_final_compilado()
    txt <- gsub("\r?\n+", " ", txt)       # troca quebras por espaço
    txt <- gsub("[ \t]{2,}", " ", txt)    # espreme múltiplos espaços
    txt <- trimws(txt)
    
    rclipboard::rclipButton(
      inputId  = "copiar_final",
      label    = "Copiar texto final",
      clipText = txt,
      icon     = icon("copy"),
      class    = "btn btn-outline-secondary"
    )
  })
  
  
  
  limpar_texto <- function(x){
    if (is.null(x) || length(x) == 0) return("")
    x <- gsub("\u00A0"," ", x, useBytes = TRUE)
    x <- gsub("<[^>]+>","", x)
    x <- gsub("[ \t]{2,}"," ", x)
    x <- gsub("\r\n","\n", x, fixed = TRUE)
    x <- gsub("\n{3,}","\n\n", x)
    trimws(x)
  }
  
  texto_secao_atual <- reactive({
    limpar_texto(if (is.null(input$texto_aluno)) "" else input$texto_aluno)
  })
  
  texto_final_compilado <- reactive({
    secs <- secoes_atual(); if (length(secs) == 0) return("")
    secao <- secs[secao_index()]
    partes <- conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes
    n_parts <- if (!is.null(partes)) length(partes) else 0
    if (n_parts == 0) return("")
    keys <- sapply(seq_len(n_parts), function(i) paste(input$tipo_estudo, estilo_aplicado(), secao, i, sep = "||"))
    comp <- vapply(keys, function(k) if (!is.null(valores$textos[[k]])) valores$textos[[k]] else "", FUN.VALUE = character(1))
    limpar_texto(paste(comp[nchar(comp) > 0], collapse = "\n\n"))
  })
  
  
  observeEvent(input$copiar_secao, ignoreInit = TRUE, {
    session$sendCustomMessage("savedToast", list(text="Seção copiada!"))
  })
  observeEvent(input$copiar_final, ignoreInit = TRUE, {
    session$sendCustomMessage("savedToast", list(text="Manuscrito copiado!"))
  })
  
  observeEvent(input$open_notes, {
    secs <- secoes_atual()
    sec_atual <- if (length(secs)) secs[secao_index()] else "—"
    tipo_atual <- if (!is.null(input$tipo_estudo) && nzchar(input$tipo_estudo)) input$tipo_estudo else ""
    grp_atual  <- if (!is.null(revista_escolhida()) && nzchar(revista_escolhida())) revista_escolhida() else ""
    key <- paste(tipo_atual, grp_atual, sec_atual, sep="||")
    showModal(modalDialog(
      title = tags$strong("Notas rápidas"), easyClose = TRUE, size = "l", class = "modal-notes",
      div(style="margin-top:6px;",
          textAreaInput("quick_notes", label = NULL, value = "", width = "100%", height = "260px",
                        placeholder = "Anote ideias soltas, pendências, próximos passos, links...")
      ),
      footer = modalButton("Fechar")
    ))
    session$sendCustomMessage("setNotesKey", list(key = key))
  })
  
  chip <- function(txt, tip = NULL){
    title_attr <- if (!is.null(tip) && nzchar(tip)) paste0(txt, " — ", tip) else paste0("Inserir: ", txt)
    tags$span(class="copy-chip", `data-copy`=txt, title=title_attr, txt)
  }
  
  observeEvent(input$open_connectives, {
    cats <- list(
      list(
        title = "Addition (adição / reforço)",
        tip   = "Use para acrescentar uma ideia do mesmo lado do argumento.",
        items = list(
          list(". Moreover, ","reforça com tom formal"),
          list(". Furthermore, ","sequencia lógica (formal)"),
          list(". In addition, ","adição neutra"),
          list(". Also, ","adição neutra; evite no início de frase em textos muito formais"),
          list(". Likewise, ","paralelismo entre ideias"),
          list(". Similarly, ","paralelismo; útil em comparação")
        )
      ),
      list(
        title = "Contrast & Concession (contraste / concessão)",
        tip   = "Para oposição de ideias ou ressalvas.",
        items = list(
          list(". However, ","contraste direto; início de frase"),
          list(". Nevertheless, ","contraste com concessão (a despeito)"),
          list(". Nonetheless, ","sinônimo de nevertheless"),
          list(". On the other hand, ","apresenta o outro lado"),
          list(". Conversely, ","resultado oposto; relações simétricas"),
          list(". In contrast, ","contraste entre grupos/condições"),
          list(". Although, ","ligação intra-frase; exige oração"),
          list(". Despite, ","segue de substantivo/gerúndio (não oração)"),
          list(". Whereas, ","contraste lado a lado em uma frase")
        )
      ),
      list(
        title = "Cause–Effect / Inference (causa–efeito / inferência)",
        tip   = "Conclusões lógicas e inferências de resultados.",
        items = list(
          list(". Therefore, ","conclusão direta"),
          list(". Thus, ","conclusão formal (muito usada)"),
          list(". Consequently, ","ênfase no efeito"),
          list(". As a result, ","ênfase no resultado prático"),
          list(". Hence, ","mais formal/conciso"),
          list(". This suggests that, ","inferência com cautela")
        )
      ),
      list(
        title = "Emphasis / Highlight (ênfase / destaque)",
        tip   = "Para sublinhar um ponto chave sem soar opinativo.",
        items = list(
          list(". Notably, ","destaque factual"),
          list(". Importantly, ","ênfase em implicação prática"),
          list(". In particular, ","especifica um aspecto"),
          list(". Especially, ","salienta um subconjunto"),
          list(". Indeed, ","confirma/fortalece afirmação prévia"),
          list(". Crucially, ","destaque crítico (use com parcimônia)")
        )
      ),
      list(
        title = "Sequence / Structure (sequência / estrutura)",
        tip   = "Organiza a narrativa do parágrafo ou seção.",
        items = list(
          list(". First, ","primeiro ponto"),
          list(". Second, ","segundo ponto"),
          list(". Finally, ","encerramento da lista"),
          list(". Next, ","passo seguinte"),
          list(". Subsequently, ","acontecimento posterior"),
          list(". Initially, ","situação inicial"),
          list(". Ultimately, ","resultado final"),
          list(". Meanwhile, ","evento paralelo")
        )
      ),
      list(
        title = "Examples / Elaboration (exemplos / detalhamento)",
        tip   = "Introduz exemplos e detalhes explicativos.",
        items = list(
          list(". For example, ","introduz exemplo"),
          list(". For instance, ","sinônimo de for example"),
          list(". Specifically, ","detalha/recorta o foco"),
          list(". In particular, ","destaca subconjunto"),
          list("such as","exemplifica dentro da frase"),
          list(", including","lista não exaustiva")
        )
      ),
      list(
        title = "Comparison (comparação)",
        tip   = "Comparações diretas entre grupos ou medidas.",
        items = list(
          list(",/.Compared with","comparação padrão em resultados"),
          list(". In comparison with","comparação mais formal"),
          list(". Relative to","diferença relativa/escala"),
          list("versus","em tabelas ou abreviação (vs.)"),
          list(". As compared with","variante comum")
        )
      ),
      list(
        title = "Limitations / Caveats (limitações / cautela)",
        tip   = "Sinaliza limitações e reduz overclaim.",
        items = list(
          list("should be interpreted with caution","aviso de cautela"),
          list("may have been","hedge para incerteza"),
          list(",/.At least in part","limita o escopo da afirmação"),
          list(",/.Potentially","hedge leve"),
          list(",/.To some extent","limitação de magnitude")
        )
      ),
      list(
        title = "Summary / Conclusion (resumo / conclusão)",
        tip   = "Fecha o argumento sem soar publicitário.",
        items = list(
          list(". In summary, ","resumo breve"),
          list(". Overall, ","panorama geral"),
          list(",/.Taken together, ","sintetiza múltiplas evidências"),
          list(". Collectively,","sintetiza resultados"),
          list(". In conclusion,","use com parcimônia; mais comum em cartas/editoriais")
        )
      )
    )
    
    blocks <- lapply(cats, function(cat){
      chips <- lapply(cat$items, function(it) chip(it[[1]], it[[2]]))
      tags$div(
        h4(cat$title),
        p(class="cat-tip", cat$tip),
        div(class="chip-wrap", chips),
        tags$hr()
      )
    })
    
    showModal(modalDialog(
      title = tags$strong("Conectivos em inglês (clique para inserir)"),
      easyClose = TRUE, size = "l", class = "modal-connectives",
      do.call(tagList, blocks),
      footer = modalButton("Fechar")
    ))
  })
  
  observeEvent(input$insert_term, {
    term <- tryCatch({
      if (is.list(input$insert_term) && !is.null(input$insert_term$text))
        input$insert_term$text
      else
        as.character(input$insert_term)
    }, error = function(e) "")
    if (!nzchar(term)) return(invisible())
    cur <- isolate(input$texto_aluno); if (is.null(cur)) cur <- ""
    sep <- if (nzchar(cur) && !grepl("\\s$", cur)) " " else ""
    novo <- paste0(cur, sep, term)
    updateTextAreaInput(session, "texto_aluno", value = novo)
    session$sendCustomMessage("savedToast", list(text = paste0("Inserido: ", term)))
  }, ignoreInit = TRUE)
  
  observeEvent(input$copied_term, ignoreInit = TRUE, {
    txt <- isolate(input$copied_term)
    if (!is.null(txt) && nzchar(txt)) {
      session$sendCustomMessage("savedToast", list(text = paste0("Inserido: ", txt)))
      cur <- isolate(input$texto_aluno); if (is.null(cur)) cur <- ""
      sep <- if (nzchar(cur) && !grepl("\\s$", cur)) " " else ""
      updateTextAreaInput(session, "texto_aluno", value = paste0(cur, sep, txt))
    }
  })
  
  # ---- atalhos: navegação para Abstracts e PRISMA ----
  observeEvent(input$go_abs, {
    updateTabsetPanel(session, "main_tabs", "Abstracts")
  })
  observeEvent(input$go_prisma, {
    updateTabsetPanel(session, "main_tabs", "PRISMA Flow Diagram")
  })
  
  # (opcional) mini-explicações nos botões redondos
  observeEvent(input$info_abs, {
    showModal(modalDialog(
      title = tags$strong("Abstracts"),
      p("Gere abstracts para compor seu manuscrito ou para submeter em congressos de forma simplificada e funcional."),
      easyClose = TRUE, size = "m"
    ))
  })
  observeEvent(input$info_prisma, {
    showModal(modalDialog(
      title = tags$strong("PRISMA Flow Diagram"),
      p("Preencha os campos com os resultados de sua revisão sistemática e gere um PRISMA Flow Diagram pronto para submissão na revista."),
      easyClose = TRUE, size = "m"
    ))
  })
  
  # ===================== ABSTRACTS (NOVA LÓGICA) ======================
  abs_headings <- list(
    GEN     = c("Background","Objective","Methods","Results","Conclusion"),
    JAMA    = c("Importance","Objective","Design, Setting, and Participants",
                "Interventions/Exposures","Main Outcomes and Measures",
                "Results","Conclusions and Relevance"),
    LANCET  = c("Background","Methods","Findings","Interpretation"),
    NEJM    = c("Background","Methods","Results","Conclusions"),
    NATMED  = c("Background","Methods","Results","Conclusions"),
    BMJLIKE = c("Objective","Design","Setting","Participants",
                "Interventions (if applicable)","Main outcome measures",
                "Results","Conclusions"),
    WILEY   = c("Background","Methods","Results","Conclusion"),
    CASE    = c("Background","Case presentation","Diagnostic assessment","Therapeutic intervention","Follow-up and outcomes","Conclusion")
  )
  abs_skeleton <- function(keys){
    paste(sprintf("%s: ", keys), collapse = "\n\n")
  }
  
  # exemplos dinâmicos no popover (a pedido: sempre 'TEXTOABSTRACT')
  abs_examples <- list(
    GEN     = "TEXTOABSTRACT",
    JAMA    = "TEXTOABSTRACT",
    LANCET  = "TEXTOABSTRACT",
    NEJM    = "TEXTOABSTRACT",
    NATMED  = "TEXTOABSTRACT",
    BMJLIKE = "TEXTOABSTRACT",
    WILEY   = "TEXTOABSTRACT",
    CASE    = "TEXTOABSTRACT")
  
  observeEvent(input$abs_model, {
    mdl <- input$abs_model %||% "GEN"
    keys <- abs_headings[[mdl]]
    txt  <- abs_skeleton(keys)
    updateTextAreaInput(session, "abs_text", value = txt)
    session$sendCustomMessage("jsCode", list(code="window.__absForceCount && window.__absForceCount();"))
    
    # atualiza popover do exemplo
    session$sendCustomMessage(
      "abs_set_example",
      list(title = paste0("Exemplo — ", mdl), content = abs_examples[[mdl]] %||% "TEXTOABSTRACT")
    )
  }, ignoreInit = TRUE)
  
  # conteúdo inicial do exemplo no popover
  observe({
    mdl <- isolate(input$abs_model %||% "GEN")
    session$sendCustomMessage(
      "abs_set_example",
      list(title = paste0("Exemplo — ", mdl), content = abs_examples[[mdl]] %||% "TEXTOABSTRACT")
    )
  })
  
  observeEvent(input$abs_meta_add, {
    payload <- input$abs_meta_add
    if (is.null(payload) || is.null(payload$text) || !nzchar(payload$text)) return()
    key <- switch(payload$type,
                  funding = "Funding information",
                  trial   = "Trial registration",
                  data    = "Data availability",
                  ethics  = "Ethics approval",
                  coi     = "Conflicts of interest",
                  "Info")
    cur <- isolate(input$abs_text %||% "")
    sep <- if (nzchar(cur) && !grepl("\\n\\s*$", cur)) "\n\n" else if (nzchar(cur)) "\n" else ""
    novo <- paste0(cur, sep, key, ": ", payload$text)
    updateTextAreaInput(session, "abs_text", value = novo)
    session$sendCustomMessage("jsCode", list(code="window.__absForceCount && window.__absForceCount();"))
  }, ignoreInit = TRUE)
  
  # ===================== PAGE STUDIO ====================
  output$pages_ui <- renderUI({
    tagList(
      rclipboardSetup(),  # garante copiar/colar nesta aba
      
      # estilos específicos do Page Studio (aplicados só nesta aba)
      tags$head(
        tags$style(HTML("
      /* Layout geral */
      .ps-wrap .col-left{padding-right:8px}
      .ps-wrap .col-right{padding-left:8px}

      /* Card lateral (inputs) */
      .ps-card{
        background:#ffffff;
        border:1px solid #e5e7eb;
        border-radius:14px;
        padding:16px;
        box-shadow:0 6px 18px rgba(2,6,23,.06);
      }
      .ps-sticky{ position:sticky; top:12px; }

      /* Títulos de seção e ajuda */
      .ps-sec-title{ font-weight:800; font-size:1rem; margin:4px 0 8px; color:#0f172a; }
      .ps-help{ color:#6b7280; font-size:.9rem; margin:-6px 0 10px; }

      /* Inputs mais elegantes */
      .ps-fields .form-group{ margin-bottom:10px; }
      .ps-fields input.form-control,
      .ps-fields textarea.form-control{
        background:#f8fafc; border:1px solid #e5e7eb; border-radius:10px;
      }
      .ps-fields textarea.form-control{ min-height:90px; }

      /* Ações (botões + nota) */
      .ps-actions{ display:flex; align-items:center; gap:10px; margin-top:8px; }
      .ps-note{ color:#6b7280; font-size:.9rem; }
      "))
      ),  # <<--- fecha o tags$head aqui
      
      h3("Page Studio"),
      
      fluidRow(
        class = "ps-wrap",
        column(5, class = "col-left",  uiOutput("page_fields")),
        column(7, class = "col-right", uiOutput("page_preview"))
      )
    )
  })
  
  
  # ---------------- FIELDS (lado esquerdo) ----------------
  output$page_fields <- renderUI({
    tagList(
      div(class="ps-card ps-sticky",
          # Template selector
          h4(class="ps-sec-title","Template"),
          div(class="ps-fields",
              selectInput(
                "page_template", label = NULL,
                choices  = c("Title Page", "Cover Letter"),
                selected = isolate(input$page_template) %||% "Title Page"
              )
          ),
          
          tags$hr(),
          
          # --- Campos Title Page ---
          conditionalPanel(condition = "input.page_template.indexOf('Title Page') === 0",
                           h4(class="ps-sec-title","Title Page"),
                           p(class="ps-help","Essa será a primeira página de seu artigo, preencha com atenção!"),
                           div(class="ps-fields",
                               textInput("tp_title","Título de seu artigo",""),
                               textAreaInput("tp_authors","Autores","",      height = "80px"),
                               textAreaInput("tp_aff","Afiliações","",     height = "100px")
                           ),
                           tags$hr(),
                           h4(class="ps-sec-title","Corresponding author"),
                           div(class="ps-fields",
                               textInput("tp_corr_name","Name",""),
                               textInput("tp_corr_email","E-mail",""),
                               textInput("tp_corr_phone","Telephone",""),
                               textInput("tp_corr_address","Address",""),
                               textInput("tp_corr_orcid","ORCID","")
                           )
          ),
          
          # --- Campos Cover Letter ---
          conditionalPanel(condition = "input.page_template.indexOf('Cover Letter') === 0",
                           h4(class="ps-sec-title","Cover Letter"),
                           p(class="ps-help","Essa é a carta que você submete junto com seu artigo. Não é obrigatória em algumas revistas, mas é sempre de bom tom enviar!"),
                           div(class="ps-fields",
                               textInput("cl_date", "Data do dia", value = format(Sys.Date(), "%B %d, %Y")),
                               textInput("cl_journal", "Revista", ""),
                               textInput("cl_title",   "Título de seu artigo", ""),
                               textInput("cl_first_author", "Primeiro autor", ""),
                               textAreaInput("cl_mainfind", "Achados principais", "", height = "110px")
                           ),
                           tags$hr(),
                           h4(class="ps-sec-title","Assinaturas"),
                           div(class="ps-fields",
                               textInput("cl_corr_name",  "Autor correspondente — Nome", ""),
                               textAreaInput("cl_corr_aff","Afiliação do autor correspondente","", height = "60px"),
                               textInput("cl_senior_name","Autor sênior — Nome", ""),
                               textAreaInput("cl_senior_aff","Afiliação do autor sênior","", height = "60px")
                           )
          ),
          
          # Ações
          div(
            class = "ps-actions",
            
            # --- AÇÕES QUANDO Title Page ---
            conditionalPanel(
              condition = "input.page_template.indexOf('Title Page') === 0",
              
              # Botão para baixar o .docx
              downloadButton("tp_docx", "Salvar em docx",
                             class = "btn btn-outline-secondary")
              ),
              
            
            # --- AÇÕES QUANDO Cover Letter (permanece) ---
            conditionalPanel(
              condition = "input.page_template.indexOf('Cover Letter') === 0",
              actionButton("ps_print_cover", "Imprimir/Salvar PDF",
                           icon = icon("print"), class = "btn btn-primary")
              )
          )
      )
    )
  })  # <-- FECHA page_fields AQUI
  
  # ---------------- PREVIEW (lado direito) ----------------
  output$page_preview <- renderUI({
    tp <- input$page_template %||% "Title Page (genérica)"
    
    if (grepl("^Title Page", tp)) {
      
      tags$div(class="a4",
               if (nzchar(input$tp_title   %||% "")) tags$h1(class="ps-title",    input$tp_title),
               if (nzchar(input$tp_authors %||% "")) tags$div(class="ps-authors", input$tp_authors),
               if (nzchar(input$tp_aff     %||% "")) tags$div(class="ps-aff",     input$tp_aff),
               
               {
                 nm <- input$tp_corr_name    %||% ""
                 em <- input$tp_corr_email   %||% ""
                 ph <- input$tp_corr_phone   %||% ""
                 ad <- input$tp_corr_address %||% ""
                 oc <- input$tp_corr_orcid   %||% ""
                 if (any(nzchar(c(nm, em, ph, ad, oc)))) {
                   tags$div(class = "ps-corr ps-corr-block",
                            tags$p(tags$span(class="lbl","Corresponding author:")),
                            tags$p(paste0(
                              nm,
                              if (nzchar(nm) && nzchar(em)) "; " else "",
                              if (nzchar(em)) paste0("E-mail: ", em) else ""
                            )),
                            tags$p(tags$span(class="ps-corr-row",
                                             tags$span(if (nzchar(ph)) paste0("Telephone: ", ph) else ""),
                                             tags$span(if (nzchar(ad)) paste0(" Address: ", ad) else "")
                            )),
                            tags$p(if (nzchar(oc)) paste0("ORCID: ", oc) else "")
                   )
                 }
               }
      )
      
    } else if (grepl("^Cover Letter", tp)) {
      
      # Estilos Times
      tnr <- "font-family:'Times New Roman', Times, serif;"
      p11 <- paste(tnr, "font-size:11pt; line-height:1.45; margin:0 0 10pt; text-align:left;")
      h12 <- paste(tnr, "font-size:12pt; font-weight:700; text-align:center; margin:0 0 8pt;")
      right11 <- paste(p11, "text-align:right;")
      
      # Inputs
      date_str    <- input$cl_date     %||% format(Sys.Date(), "%B %d, %Y")
      journal_str <- input$cl_journal  %||% ""
      title_str   <- input$cl_title    %||% ""
      mf_str      <- input$cl_mainfind %||% ""
      
      corr_name <- input$cl_corr_name   %||% ""
      corr_aff  <- input$cl_corr_aff    %||% ""
      sen_name  <- input$cl_senior_name %||% ""
      sen_aff   <- input$cl_senior_aff  %||% ""
      
      # First author (novo)
      first_author <- trimws(input$cl_first_author %||% "")
      fa_name <- if (nzchar(first_author)) first_author else "SEU SOBRENOME PARA CITAÇÃO (Ex: Menegaz de Almeida)"  # fallback
      
      # 1º parágrafo (usa fa_name!)
      first_par <- paste0(
        "Please find attached for your kind review our manuscript entitled “",
        if (nzchar(title_str)) title_str else
          "SEU TÍTULO EM INGLÊS",
        "” by ", fa_name, " et al. We would be very grateful to have this manuscript considered for publication in your esteemed journal."
      )
      
      second_par <- if (nzchar(mf_str)) paste0("In brief, ", mf_str) else NULL
      third_par <- paste0(
        "This is an original article, with no portion under consideration for publication elsewhere or previously published. ",
        "All authors participated in the interpretation of data, reviewed the manuscript, and approved its submission. ",
        "We look forward to receiving your thoughts and comments on our manuscript and hope you will find it acceptable for publication."
      )
      
      tags$div(
        class = "preview-wrap",
        actionButton(
          "cl_example_btn", label = NULL, icon = icon("search"),
          class = "cl-example-btn", title = "Ver exemplo"
        ),
        tags$div(class="a4",
                 if (nzchar(title_str)) tags$h1(style = h12, title_str),
                 tags$p(style = p11, date_str),
                 tags$p(style = p11,
                        paste0("Dear Editor-in-Chief of the",
                               if (nzchar(journal_str)) paste0(" ", journal_str) else "", ",")
                 ),
                 tags$p(style = p11, first_par),
                 if (!is.null(second_par)) tags$p(style = p11, second_par),
                 tags$p(style = p11, third_par),
                 tags$p(style = p11, "Sincerely,"),
                 if (nzchar(corr_name)) tags$p(style = right11, corr_name),
                 if (nzchar(corr_aff))  tags$p(style = right11, corr_aff),
                 if (nzchar(sen_name))  tags$p(style = right11, sen_name),
                 if (nzchar(sen_aff))   tags$p(style = right11, sen_aff)
        )
      )
      
    } else {
      tags$div(class="a4", tags$p("Selecione um template válido."))
    }
  })
  
  observeEvent(input$cl_example_btn, {
    tnr <- "font-family:'Times New Roman', Times, serif;"
    p11 <- paste(tnr, "font-size:11pt; line-height:1.45; margin:0 0 10pt; text-align:left;")
    h12 <- paste(tnr, "font-size:12pt; font-weight:700; text-align:center; margin:0 0 8pt;")
    right11 <- paste(p11, "text-align:right;")
    
    showModal(modalDialog(
      title = "Cover Letter — Exemplo",
      size = "l", easyClose = TRUE, footer = modalButton("Fechar"),
      tags$div(
        tags$h3("Cover Letter", style = h12),
        tags$p("August 17, 2025", style = p11),
        tags$p("Dear Editor-in-Chief of the Brain Injury Journal,", style = p11),
        tags$p("Please find attached for your kind review our manuscript entitled “Liberal versus Restrictive Transfusion Strategy in Patients with Acute Brain Injury: a Systematic Review and Meta-Analysis” by Menegaz de Almeida et al. We would be very grateful to have this manuscript considered for publication in your esteemed journal.", style = p11),
        tags$p("Brain injury is the leading cause of death and disability worldwide, with nearly 30% of survivors of severe traumatic brain injury (TBI) experiencing long-term neurological sequelae. Anemia is a significant factor in worsening outcomes for critically ill patients with acute brain injury, often resulting from blood loss or excessive fluid administration. This complication occurs in approximately 50% of patients within a week after injury, with nearly 80% receiving blood transfusions. While anemia is common among ICU patients, there is a lack of clear guidelines regarding optimal hemoglobin (Hb) thresholds for red blood cell (RBC) transfusions in acute brain injury cases. The Brain Trauma Foundation Guidelines, the most widely used resource for traumatic brain injury patients, does not specify a target Hb level. Moreover, the preferred Hb threshold for acute brain injury patients remains unclear, particularly whether transfusion should be triggered by Hb levels below 7 g/dL or if more liberal approaches, with triggers below 9 or 10 g/dL, are equally safe. Given the potential to improve outcomes for millions of critically ill acute brain injury patients, this meta-analysis aimed to evaluate recent data to determine whether restrictive or liberal transfusion strategies are preferable for this population.", style = p11),
        tags$p(paste0(
          "This is an original article, with no portion under consideration for publication elsewhere or previously published. ",
          "All authors participated in the interpretation of data, reviewed the manuscript, and approved its submission. ",
          "We look forward to receiving your thoughts and comments on our manuscript and hope you will find it acceptable for publication."
        ), style = p11),
        tags$p("Sincerely,", style = p11),
        tags$p("Artur Menegaz de Almeida",  style = right11),
        tags$p("Federal University of Mato Grosso, Sinop, Brazil",   style = right11),
        tags$p("Autor sênior", style = right11),
        tags$p("Afiliação do autor sênior",   style = right11)
      )
    ))
  })
  
  # Cover Letter: imprimir/salvar PDF em nova janela limpa
  observeEvent(input$ps_print_cover, ignoreInit = TRUE, {
    session$sendCustomMessage("jsCode", list(code = "
    (function(){
      // pega a prévia da cover letter
      var node = document.querySelector('#page_preview .a4') || document.querySelector('.a4');
      if(!node){ alert('Nada para imprimir.'); return; }

      // abre janela temporária só para imprimir
      var win = window.open('', '_blank', 'noopener,noreferrer');
      win.document.write(`<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<title>Cover Letter</title>
<style>
  @page { size: A4; margin: 20mm; }
  body { -webkit-print-color-adjust: exact; print-color-adjust: exact;
         font-family: 'Times New Roman', Times, serif; }
  .a4 { width: 210mm; min-height: 297mm; padding: 0; border: none; box-shadow: none; }
  h1 { font-size: 12pt; font-weight: 700; text-align: center; margin: 0 0 8pt; }
  p  { font-size: 11pt; line-height: 1.45; margin: 0 0 10pt; text-align: left; }
</style>
</head>
<body>
  <div class='a4'>` + node.innerHTML + `</div>
</body>
</html>`);
      win.document.close();
      win.focus();
      win.print();
      setTimeout(function(){ try{ win.close(); }catch(e){} }, 300);
    })();
  "))
  })
  
  observeEvent(input$pr_print, {
    session$sendCustomMessage("jsCode", list(code = "
    (function(){
      var svg = document.querySelector('.prisma-svg');
      if(!svg){ alert('Nada para imprimir.'); return; }
      var html = \"<!doctype html><html><head><meta charset='utf-8'><title>PRISMA</title>\" +
                 \"<style>@page{size:A4 landscape;margin:10mm;} body{-webkit-print-color-adjust:exact;print-color-adjust:exact;} svg{width:100%;height:auto;display:block;}</style>\" +
                 \"</head><body>\" + svg.outerHTML + \"</body></html>\";
      var blob = new Blob([html], {type:'text/html'}), url = URL.createObjectURL(blob), win = window.open(url,'_blank');
      if(!win){ alert('Permita pop-ups para imprimir.'); return; }
      var t = setInterval(function(){
        try{
          if (win.document && win.document.readyState === 'complete'){
            clearInterval(t); win.focus(); win.print();
            setTimeout(function(){ try{ win.close(); }catch(e){} URL.revokeObjectURL(url); }, 400);
          }
        }catch(e){}
      }, 120);
    })();
  "))
  })
  
  # --- Monta o texto "limpo" para copiar da Title Page
  page_clip_text <- reactive({
    tp  <- input$page_template %||% "Title Page (genérica)"
    if (!grepl("^Title Page", tp)) return("")
    
    ttl <- input$tp_title     %||% ""
    aut <- input$tp_authors   %||% ""
    aff <- input$tp_aff       %||% ""
    nm  <- input$tp_corr_name    %||% ""
    em  <- input$tp_corr_email   %||% ""
    ph  <- input$tp_corr_phone   %||% ""
    ad  <- input$tp_corr_address %||% ""
    oc  <- input$tp_corr_orcid   %||% ""
    
    corr <- character(0)
    if (any(nzchar(c(nm, em, ph, ad, oc)))) {
      corr <- c(
        "Corresponding author:",
        paste0(
          nm,
          if (nzchar(nm) && nzchar(em)) "; " else "",
          if (nzchar(em)) paste0("E-mail: ", em) else ""
        ),
        trimws(paste(
          if (nzchar(ph)) paste0("Telephone: ", ph) else "",
          if (nzchar(ad)) paste0("Address: ", ad) else ""
        )),
        if (nzchar(oc)) paste0("ORCID: ", oc) else ""
      )
    }
    
    out <- paste(
      c(
        if (nzchar(ttl)) ttl else NULL,
        if (nzchar(aut)) aut else NULL,
        if (nzchar(aff)) aff else NULL,
        if (length(corr)) corr else NULL
      ),
      collapse = "\n\n"
    )
    
    out <- gsub("\r\n", "\n", out, fixed = TRUE)
    out <- gsub("[ \t]{2,}", " ", out)
    out <- gsub("\n{3,}", "\n\n", out)
    trimws(out)
  })
  
  # --- UI do botão de copiar (aparece no card)
  output$ps_copy_ui <- renderUI({
    rclipboard::rclipButton(
      inputId  = "page_copy",
      label    = "Copiar conteúdo",
      clipText = page_clip_text(),
      icon     = icon("copy"),
      class    = "btn btn-outline-secondary"
    )
  })
  
  # --- Toast de feedback ao copiar
  observeEvent(input$page_copy, ignoreInit = TRUE, {
    session$sendCustomMessage("savedToast", list(text = "Conteúdo copiado!"))
  })
  
  # ===================== PRISMA SVG =====================
  output$prisma_ui <- renderUI({
    tags$div(
      class = "prisma-page",
      
      # Título opcional
      h3("PRISMA Flow Diagram"),
      div(class = "prisma-flow", uiOutput("prisma_svg")),
      
      
      # Campos em 3 colunas, abaixo do fluxo
      div(class = "prisma-grid",
          
          # Coluna 1
          div(class = "prisma-col",
              h5("Search results"),
              numericInput("pr_scopus","SCOPUS",0,min=0,step=1),
              numericInput("pr_wos","Web of Science",0,min=0,step=1),
              numericInput("pr_medline","PubMed/MEDLINE",0,min=0,step=1),
              numericInput(
                "pr_cochrane",
                "Cochrane",
                value = 0,   
                min = 0, step = 1
              ),
              tags$hr(),
              h5("Initial screening"),
              numericInput("pr_dup","Duplicated removed",0,min=0,step=1),
              numericInput("pr_ta_excl","Excluded by title/abstract",0,min=0,step=1)
          ),
          
          # Coluna 2
          div(class = "prisma-col",
              h5("Full-text"),
              numericInput("pr_fulltext", "Full-text assessed", 0, min = 0, step = 1),
              numericInput("pr_wdesign","Wrong design",0,min=0,step=1),
              numericInput("pr_woutcome","Wrong outcome",0,min=0,step=1),
              numericInput("pr_wpop","Wrong population",0,min=0,step=1),
              numericInput("pr_abs","Abstract only",0,min=0,step=1)
          ),
          
          # Coluna 3
          div(class = "prisma-col",
              h5("Included"),
              numericInput("pr_included","Included studies",0,min=0,step=1),
              numericInput("pr_origin","Studies included in the meta-analysis (optional)",value = 0, min = 0, step = 1),
              tags$hr(),
              div(class="prisma-btns",
                  actionButton("pr_print","Salvar PDF", class="btn btn-primary"),
                  span(class="prisma-note","Pronto para submissão na revista!")
              ),
              uiOutput("prisma_checks")
          )
      )
    )
  })
  
  output$prisma_svg <- renderUI({
    # helpers locais
    svg_text <- function(x, y, txt, size=12, weight=600, anchor="start"){
      tags$text(
        x = x, y = y, txt,
        style = sprintf(
          "font-family:Inter,Arial,sans-serif;font-size:%dpx;font-weight:%d;fill:#111827;",
          size, weight
        ),
        `text-anchor` = anchor
      )
    }
    svg_box <- function(x,y,w,h,title, lines){
      list(
        tags$rect(x=x, y=y, width=w, height=h, rx=8, ry=8,
                  style="fill:#fafafa;stroke:#334155;stroke-width:1.2"),
        svg_text(x+w/2, y+20, title, size=14, weight=800, anchor="middle"),
        {
          yy <- y+40; kids <- list()
          for (ln in lines) { kids <- append(kids, list(svg_text(x+10, yy, ln))); yy <- yy + 18 }
          kids
        }
      )
    }
    svg_arrow <- function(x1,y1,x2,y2){
      tags$line(x1=x1,y1=y1,x2=x2,y2=y2,
                style="stroke:#334155;stroke-width:1.4", `marker-end`="url(#arrow)")
    }
    
    # -------- layout compacto (sem espaço morto) --------
    W     <- 1100
    colW  <- 250
    boxH  <- 150
    
    marginX <- 8      # reduza para 0 se quiser colar no limite esquerdo
    topY    <- 26
    
    # gap calculado para as 4 colunas ocuparem exatamente W
    gap <- (W - 2*marginX - 4*colW) / 3
    
    # altura justa ao conteúdo
    H <- topY + boxH + 56
    
    # posições X das 4 caixas
    x1 <- marginX
    x2 <- x1 + colW + gap
    x3 <- x2 + colW + gap
    x4 <- x3 + colW + gap
    
    # -------- dados / linhas --------
    pr_total <- (input$pr_scopus %||% 0) + (input$pr_wos %||% 0) +
      (input$pr_medline %||% 0) + (input$pr_cochrane %||% 0)
    pr_screened <- max(0, pr_total - (input$pr_dup %||% 0))
    pr_full_excl_sum <- (input$pr_wdesign %||% 0) + (input$pr_woutcome %||% 0) +
      (input$pr_abs %||% 0) + (input$pr_wpop %||% 0)
    pr_included <- max(0, (input$pr_fulltext %||% 0) - pr_full_excl_sum)
    
    lines_col1 <- c(
      sprintf("SCOPUS: %d",   input$pr_scopus %||% 0),
      sprintf("Web of Science: %d", input$pr_wos %||% 0),
      sprintf("MEDLINE: %d",  input$pr_medline %||% 0),
      if ((as.integer(input$pr_cochrane %||% 0)) > 0)
        sprintf("Cochrane: %d", as.integer(input$pr_cochrane %||% 0))
      else
        NULL
    )
    lines_col2 <- c(
      sprintf("Duplicated removed: %d", input$pr_dup %||% 0),
      sprintf("Total screened: %d", pr_screened),
      sprintf("Excluded by title/abstract: %d", input$pr_ta_excl %||% 0)
    )
    lines_col3 <- c(
      sprintf("Wrong design: %d", input$pr_wdesign %||% 0),
      sprintf("Wrong outcome: %d", input$pr_woutcome %||% 0),
      sprintf("Wrong population: %d", input$pr_wpop %||% 0),
      sprintf("Abstract only: %d", input$pr_abs %||% 0)
    )
    lines_col4 <- c(
      sprintf("Included studies: %d", input$pr_included %||% 0),
      if ((input$pr_origin %||% 0) > 0)
        sprintf("Studies included in the meta-analysis: %d", as.integer(input$pr_origin %||% 0))
      else
        NULL
    )
    
    # -------- SVG --------
    tags$svg(
      viewBox = sprintf("0 0 %d %d", W, H),
      class   = "prisma-svg",
      style   = "width:100%;max-width:1100px;height:auto;display:block;",
      xmlns   = "http://www.w3.org/2000/svg",
      preserveAspectRatio = "xMidYMid meet",
      tags$defs(
        tags$marker(id="arrow", viewBox="0 0 10 10", refX="10", refY="5",
                    markerWidth="8", markerHeight="8", orient="auto-start-reverse",
                    tags$path(d="M 0 0 L 10 5 L 0 10 z", style="fill:#334155;"))
      ),
      svg_text(W/2, 18, "PRISMA 2020 Flow Diagram", size=18, weight=800, anchor="middle"),
      svg_box(x1, topY, colW, boxH, "Search results",    lines_col1),
      svg_box(x2, topY, colW, boxH, "Initial screening", lines_col2),
      svg_box(x3, topY, colW, boxH, "Excluded",          lines_col3),
      svg_box(x4, topY, colW, boxH, "Included",          lines_col4),
      svg_arrow(x1+colW, topY+boxH/2, x2, topY+boxH/2),
      svg_arrow(x2+colW, topY+boxH/2, x3, topY+boxH/2),
      svg_arrow(x3+colW, topY+boxH/2, x4, topY+boxH/2)
    )
  })
  
  # ===== Helpers para escrever parágrafos no Word =====
  wp_add_block <- function(doc, text, size = 11, bold = FALSE, italic = FALSE,
                           align = c("left","center","right","justify")) {
    if (!nzchar(text)) return(doc)
    align <- match.arg(align)
    # Respeita quebras de linha do textarea
    lines <- unlist(strsplit(text, "\n", fixed = TRUE))
    for (ln in lines) {
      ln <- trimws(ln)
      if (!nzchar(ln)) { doc <- body_add_par(doc, "", style = "Normal"); next }
      ft <- ftext(ln, fp_text(font.size = size,
                              bold = bold, italic = italic,
                              font.family = "Times New Roman"))
      fp <- fp_par(text.align = align)
      doc <- body_add_fpar(doc, fpar(ft, fp_p = fp))
    }
    # espaçamento depois do bloco
    doc <- body_add_par(doc, "", style = "Normal")
    doc
  }
  
  # ====== DOWNLOAD: Title Page -> DOCX (único, id = tp_docx) ======
  output$tp_docx <- downloadHandler(
    filename = function() {
      ttl <- isolate(input$tp_title) %||% "Title_Page"
      paste0(gsub("[^A-Za-z0-9_-]+", "_", ttl), ".docx")
    },
    contentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    content = function(file) {
      ttl <- isolate(input$tp_title)        %||% ""
      aut <- isolate(input$tp_authors)      %||% ""
      aff <- isolate(input$tp_aff)          %||% ""
      nm  <- isolate(input$tp_corr_name)    %||% ""
      em  <- isolate(input$tp_corr_email)   %||% ""
      ph  <- isolate(input$tp_corr_phone)   %||% ""
      ad  <- isolate(input$tp_corr_address) %||% ""
      oc  <- isolate(input$tp_corr_orcid)   %||% ""
      
      doc <- officer::read_docx()
      
      # Título — Times 12, bold, centrado
      if (nzchar(ttl)) doc <- wp_add_block(doc, ttl, size = 12, bold = TRUE, align = "center")
      # Autores — Times 11, justificado
      if (nzchar(aut)) doc <- wp_add_block(doc, aut, size = 11, align = "justify")
      # Afiliações — Times 10, itálico, esquerda
      if (nzchar(aff)) doc <- wp_add_block(doc, aff, size = 10, italic = TRUE, align = "left")
      
      # Corresponding author — 4 linhas
      if (any(nzchar(c(nm, em, ph, ad, oc)))) {
        doc <- wp_add_block(doc, "Corresponding author:", size = 11, bold = TRUE, align = "left")
        
        line2 <- paste0(
          nm,
          if (nzchar(nm) && nzchar(em)) "; " else "",
          if (nzchar(em)) paste0("E-mail: ", em) else ""
        )
        if (nzchar(gsub("\\s+","", line2))) doc <- wp_add_block(doc, line2, size = 11, align = "left")
        
        line3 <- paste0(
          if (nzchar(ph)) paste0("Telephone: ", ph) else "",
          if (nzchar(ph) && nzchar(ad)) "  " else "",
          if (nzchar(ad)) paste0("Address: ", ad) else ""
        )
        if (nzchar(gsub("\\s+","", line3))) doc <- wp_add_block(doc, line3, size = 11, align = "left")
        
        if (nzchar(oc)) doc <- wp_add_block(doc, paste0("ORCID: ", oc), size = 11, align = "left")
      }
      
      print(doc, target = file)
    }
  )
  
  # --- ÚNICO detector de última parte (sem JS) ---
  ultima_parte <- reactive({
    secs <- secoes_atual(); if (length(secs) == 0) return(FALSE)
    secao <- secs[secao_index()]
    partes <- tryCatch(
      conteudo[[input$tipo_estudo]][[estilo_aplicado()]][[secao]]$partes,
      error = function(e) NULL
    )
    n_parts <- if (is.null(partes)) 0L else length(partes)
    # sua página final é a extra (n_parts + 1)
    parte_index() > n_parts
  })
  
  # --- helper: refs vindas dos EXEMPLOS da PRIMEIRA parte ---
  refs_primeira_parte <- function() {
    te   <- input$tipo_estudo %||% ""
    est  <- tryCatch(estilo_aplicado(), error = function(e) NULL)
    secs <- secoes_atual()
    if (!length(secs) || is.null(est) || !nzchar(te)) return(character(0))
    
    sec  <- secs[secao_index()]
    p1   <- tryCatch(conteudo[[te]][[est]][[sec]]$partes[[1]],
                     error = function(e) NULL)
    if (is.null(p1) || is.null(p1$exemplos)) return(character(0))
    
    refs <- vapply(p1$exemplos, function(x) x$ref %||% "", FUN.VALUE = character(1))
    unique(refs[nzchar(refs)])
  }
  
  # --- Bloco final: refs + texto final + copiar (só na última parte) ---
  output$refs_simples <- renderUI({
    if (!isTRUE(ultima_parte())) return(NULL)
    
    # 1) pega refs dos exemplos da 1ª parte
    refs <- refs_primeira_parte()
    
    # 2) fallback por tipo de estudo (se nada vier dos exemplos)
    if (!length(refs)) {
      te <- input$tipo_estudo %||% ""
      refs <- switch(te,
                     "Systematic Review and Meta-Analysis" = c("PRISMA 2020", "Cochrane Handbook"),
                     "Revisão sistemática"                 = c("PRISMA 2020", "Cochrane Handbook"),
                     "Meta-análise"                        = c("PRISMA 2020", "Cochrane Handbook"),
                     "Relato de caso"                      = c("CARE 2013/2020"),
                     "Carta ao Editor"                     = c("Siga as diretrizes da revista-alvo."),
                     c("Verifique as Instruções aos Autores da revista-alvo.")
      )
    }
    
    tagList(
      div(style = "margin:10px 0 12px; padding-left:18px;",
          tags$ul(lapply(refs, tags$li))
      ),
      uiOutput("texto_final_aluno"),
      uiOutput("copy_buttons_final")
    )
  })
  
  # --- Evita hibernar quando escondido ---
  outputOptions(output, "refs_simples",       suspendWhenHidden = FALSE)
  outputOptions(output, "texto_final_aluno",  suspendWhenHidden = FALSE)
  outputOptions(output, "copy_buttons_final", suspendWhenHidden = FALSE)
}
  
shinyApp(app_ui, server)