#create a new folder to store the data
mkdir data & cd data

#downloads all the LAS files in the database
##edit tot remove LAS files with GR suffix
wget -r -A.LAS -np -nd -q https://certmapper.cr.usgs.gov/data/PubArchives/OF00-200/WELLS/WELLIDX.HTM

#downloads all the well tops
 wget -r --ignore-case -A '*Tops.txt' -np -nd -q https://certmapper.cr.usgs.gov/data/PubArchives/OF00-200/WELLS/WELLIDX.HTM

#return only the rock unit and depth
##not yet saving properly
for well_tops in *.TXT
do
  sed -n "$(grep -n -i 'well name' $well_tops | cut -f1 -d:),$(grep -n -i 'data source' $well_tops | cut -f1 -d:) p" $well_tops | head -n -2 >> $(echo $well_tops | cut -d "." -f 1).txt
done


###RShiny for interactive visualization
###make a bash script that can call python and R or the other way around

#latex (for writing journal)