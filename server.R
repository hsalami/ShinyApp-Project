library(shiny)


shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    if (input$dist==1){
      output$rateO=renderUI({sliderInput("rate","Distribution Parameter (Rate):",min=0.5,max=2,value=isolate(input$rate))})
      x=seq(0,10,0.1)
      validate(need(input$rate!="",message="",label=""))
      num=reactive({dexp(x,rate=input$rate)})
      plot(x,num(),type='l',ylab="Density Function f(x)" ,main="Exponential Distribution",xlab="x",col="blue",ylim=c(0,2))
      }
    else{
      output$rateO=renderUI({sliderInput("rate2","Parameter (Range):",min=-5,max=5,value=c(isolate(input$rate2[1]),isolate(input$rate2[2])))})
      x=seq(-5.1,5.1,0.01)
      validate(need(input$rate2[1]!="",message="",label=""))
      validate(need(input$rate2[2]!="",message="",label=""))
      num=reactive({dunif(x,min=input$rate2[1],max=input$rate2[2])})
      plot(x,num(),type='l',ylab="Density Function f(x)",xlab="x",main="Uniform Distribution",col="blue",ylim=c(0,0.5))
      }
    })
  
  output$plot<-renderPlot({
    numb=input$samp
    if (input$start==0){
      NULL
      }
    else{
      if(input$dist==1){
        means={}
        for (i in seq(1,numb)){
          validate(need(input$rate!="",message="",label=""))
          data=rexp(input$num,input$rate)
          mes=mean(data)
          means=c(means,mes)}
        hist(means, xlab='Sample Means', col='orange',main='Histogram of sample Means')
      }
      else{
        means={}
        for (i in seq(1,numb)){
          validate(need(input$rate2[1]!="",message="",label=""))
          validate(need(input$rate2[2]!="",message="",label=""))
          data=runif(input$num,input$rate2[1],input$rate2[2])
          mes=mean(data)
          means=c(means,mes)}
        hist(means,xlab='Sample Means', col='orange',main='Histogram of Sample Means')
      }
    }
  })
  
})
