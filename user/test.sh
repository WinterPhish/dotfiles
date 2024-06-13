imgpath="~/wallpapers/current/aux.jpg"
theme=$(flavours current)
if [[ $theme == "generated" ]]; then
  exit 0
fi
mkdir -p ~/wallpapers/$theme
cp $imgpath ~/wallpapers/$theme/
theme=$(basename -s .jpg $imgpath)
if [[ $theme == "aux" ]]; then
  flavours generate dark $imgpath
  flavours apply generated
else 
  flavours apply $theme
fi
