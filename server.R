
get_input_name <- function(input){
  split <- (strsplit(input, split=' '))[[1]]
  return(split[1])
}

shinyServer(function(input, output) {
  mod_SIVEP_server("SIVEP_incompletude", indicador = 'incom')
  mod_SIVEP_server("SIVEP_implausibilidade", indicador = 'implau')
  mod_SIVEP_server("SIVEP_inconsistencia", indicador = 'incon')
  mod_SINASC_server("SINASC_incompletude",indicador = 'incom')
  mod_SINASC_server("SINASC_implausibilidade",indicador = 'implau')
  mod_SINASC_server("SINASC_inconsistencia",indicador = 'incon')
  observeEvent(input$help, {
    # Show a modal when the button is pressed
    shinyalert::shinyalert("Ajuda",html =T,text = tagList("TEXTO AJUDA",
                                                          tags$video(type ='video/mp4',src = 'www/hello-there.mp4', width = '100%',
                                                                     controls = 'controls')))
  })
})