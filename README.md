srtSubtitleCreator
==================

a processing sketch to convert tab delineated .txt files containing subtitle information to an .srt subtitle format

.srt files can be played with the original video file in VLC player for rather painless subtitling.


The program accepts files stored in the following format

inFrame   |    outFrame    |     subtitle line one    |     subtitle line two

inFrame  :: frame number where subtitle should be begin
outFrame :: frame number when the subtitle should end
line one :: top line of subtitle
line two :: second line of subtitle (optional)

The simplest way to create the .txt file is to place your subtitles
in an excel document and export as a tab delineated .txt file.
See example.xls for an example of the correct formating.

Created for the Studio of Creative Inquiry @ Carnegie Mellon University

