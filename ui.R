source('mod_SIVEP.R')
source('mod_SINASC.R')
tagList(
  # Your application UI logic
  shinyjs::useShinyjs(),
  shinydashboard::dashboardPage(
    shinydashboard::dashboardHeader(title = "Qualidados", titleWidth = 160),
    shinydashboard::dashboardSidebar(
      width = 160,
      shinydashboard::sidebarMenu(
        style = "position: fixed; overflow: visible;",
        shinydashboard::menuItem(
          "SIVEP-GRIPE" ,
          tabname = "sivep",
          icon = icon("table"),
          startExpanded = TRUE,
          shinydashboard::menuSubItem("Incompletude",
                                      tabName = "incom_sivep"),
          shinydashboard::menuSubItem("Implausibilidade",
                                      tabName = "implau_sivep"),
          shinydashboard::menuSubItem("Inconsist\u00eancia",
                                      tabName = "incons_sivep")
        ),
        shinydashboard::menuItem(
          "SINASC" ,
          tabname = "sinasc",
          icon = icon("table"),
          shinydashboard::menuSubItem("Incompletude",
                                      tabName = "incom_sinasc"),
          shinydashboard::menuSubItem("Implausibilidade",
                                      tabName = "implau_sinasc"),
          shinydashboard::menuSubItem("Inconsist\u00eancia",
                                      tabName = "incons_sinasc")
          
        ),
        shinydashboard::menuItem(
          "SIM" ,
          tabname = "sim",
          icon = icon("table"),
          shinydashboard::menuSubItem("Incompletude",
                                      tabName = "incom_sim"),
          
          shinydashboard::menuSubItem("Implausibilidade",
                                      tabName = "implau_sim"),
          shinydashboard::menuSubItem("Inconsist\u00eancia",
                                      tabName = "incons_sim")
          
        ),
        shiny::actionButton('help','Ajuda',icon('question',lib="font-awesome"),
                            style =  "color: #0A1E3;
                              background-color: white;
                              border-color: #0A1E3")
      )
    ),
    shinydashboard::dashboardBody(
      includeCSS("www/estilo1.css"),
      tags$script(HTML("$('body').addClass('fixed');")),
      tags$head(tags$style(
        HTML(
          '
        /* logo */
        .skin-blue .main-header .logo {
                              background-color: #0A1E3C;
                              }

        /* logo when hovered */
        .skin-blue .main-header .logo:hover {
                              background-color: #0A1E3C;
                              }

        /* navbar (rest of the header) */
        .skin-blue .main-header .navbar {
                              background-color: #0A1E3C;
                              }

        /* main sidebar */
        .skin-blue .main-sidebar {
                              background-color: #0A1E3C;
                              }

        /* active selected tab in the sidebarmenu */
        .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
                              background-color: #32A0FF;
                              }

        /* other links in the sidebarmenu */
        .skin-blue .main-sidebar .sidebar .sidebar-menu a{
                              background-color: #0A1E3C;
                              color: #FFFFFF;
                              }

        /* other links in the sidebarmenu when hovered */
         .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
                              background-color: #32A0FF;
                              }
        /* toggle button when hovered  */
         .skin-blue .main-header .navbar .sidebar-toggle:hover{
                              background-color: #32A0FF;
                              }
                              '
        ),
        HTML("hr {border-top: 1px solid #0A1E3C;}")
      )),shinydashboard::tabItems(
      mod_SIVEP_ui(id = "SIVEP_incompletude",
                   vars_incon = variaveis_incom_nomes,
                   tabname ="incom_sivep",
                   descricao =  desc_incom ,indicador = 'incom',
                   estados = sort(unique(dados_incom$SG_UF))),
      
      mod_SIVEP_ui(id = "SIVEP_implausibilidade",
                   vars_incon = var_dados_implau,
                   tabname ="implau_sivep",
                   descricao = desc_implau,indicador = 'implau',
                   estados = sort(unique(dados_implau$SG_UF))),

      mod_SIVEP_ui(id = "SIVEP_inconsistencia",
                   vars_incon = unname(vars_incon),
                   tabname ="incons_sivep",
                   descricao = desc_incon,indicador = 'incon',
                   estados = sort(unique(dados_incon$SG_UF))),
      mod_SINASC_ui(id = "SINASC_incompletude",
                    tabname = "incom_sinasc",
                    indicador = 'incom',
                    descricao = desc_incom,
                    vars = vars_incom_sinasc,
                    estados = sort(unique(Sinasc_incom$ESTADO))),
      mod_SINASC_ui(id = "SINASC_implausibilidade",
                    tabname = "implau_sinasc",
                    indicador = 'implau',
                    descricao = desc_implau,
                    vars = vars_implau_sinasc,
                    estados = sort(unique(Sinasc_implau$ESTADO))),
      mod_SINASC_ui(id = "SINASC_inconsistencia",
                    tabname = "incons_sinasc",
                    indicador = 'incon',
                    descricao = desc_incon,
                    vars = unname(var_incon_sinasc),
                    estados = sort(unique(Sinasc_incon$ESTADO)))

    )
    )
  )
)