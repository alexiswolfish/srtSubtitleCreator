/*------------------------------------------------------------*
Converts a tab deliniated .txt file to an .srt

An .srt file is composed in the following format
Subtitle number
Start time --> End time
Text of subtitle (one or more lines)
Blank line

1
00:00:20,000 --> 00:00:24,400
Altocumulus clouds occur between six thousand

2
00:00:24,600 --> 00:00:27,800
and twenty thousand feet above ground level.

developed @ the Studio for Creative Inquiry
 *------------------------------------------------------------*/

 //User specified variables, please adjust accordingly before
 //running, and make sure that the .txt file is located in
 //the data folder
 
 float frameRate = 24; 
 String filename = "Clouds_Subtitles5min.txt"; //filename of subtitle document.

 BufferedReader reader;
 PrintWriter out;
 String curLine;
 int lineCount;
 
 void setup(){
   reader = createReader(filename);
   out = createWriter(filename.substring(0,filename.length()-4) + ".srt");
   lineCount = 1;
 }
 
 void draw(){
   try{
     curLine = reader.readLine();
   }catch (IOException e){
     e.printStackTrace();
     println("error reading file, exiting");
     exit();
   }
   
   //EOF catch
   if(curLine == null){
     println("finished reading file");
     out.flush();
     out.close();
     exit();
   }
   //Parse
   else{
     String[] parser = splitTokens(curLine, "\t\"");
     if(!parser[0].equals("InF")){
       String startFrame, endFrame;
       String firstLine, secondLine;
       
       startFrame = parser[0];
       endFrame = parser[1];
       firstLine = parser[2];
       
       out.println(lineCount);
       out.println(convertToTime(float(startFrame))+" --> "+convertToTime(float(endFrame)));
       out.println(firstLine);
 
       println(curLine);
    //   println(firstLine);
       println();
 
       if(parser.length >3){
         secondLine = parser[3];
         out.println(secondLine);
       }
       out.println();
       lineCount++;
   }
 }
 }
 
 //hours:minutes:seconds,milliseconds
String convertToTime(float frameNum){
   float time = frameNum/frameRate;
   float seconds = floor(time%60.0);
   float minutes = floor(time/60.0);
   float hours = floor(minutes/60.0);
   minutes = minutes%60.0;
   float milliseconds =floor(((time%60.0)*1000)%1000);
   
   String t = int(hours)+":"+int(minutes)+":"+int(seconds)+","+int(milliseconds);
   return t;
   
 }
