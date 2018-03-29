CKEDITOR.editorConfig = function( config )
{
  config.allowedContent = true;
  config.protectedSource.push( /<%[\s\S]*?%>/g );
  config.protectedSource.push( /#{[\s\S]*?}/g );
  config.protectedSource.push( /\{\{[\s\S]*?\}\}/g );
  config.filebrowserUploadUrl = '/ckeditor/attachment_files'
  config.font_names = "Adelle Sans/'adelle-sans', 'helvetica neue', 'sans-serif'; Arial/Arial, Helvetica, sans-serif;Comic Sans MS/Comic Sans MS, cursive;Courier New/Courier New, Courier, monospace;Georgia/Georgia, serif;Lucida Sans Unicode/Lucida Sans Unicode, Lucida Grande, sans-serif;Tahoma/Tahoma, Geneva, sans-serif;Times New Roman/Times New Roman, Times, serif;Trebuchet MS/Trebuchet MS, Helvetica, sans-serif;Verdana/Verdana, Geneva, sans-serif"
  config.contentsCss = "/ckeditor.css";
}
