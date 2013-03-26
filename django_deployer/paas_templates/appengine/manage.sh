env/bin/python {{ project_name }}/manage.py $@ --settings={{ project_name }}.settings_appengine
APPENGINE_SDK_LOCATION="{{ sdk_location }}"
args=$@

# TODO: i think this line needs to go in front of the manage.py command. 
export PYTHONPATH="env/lib/python2.7:$APPENGINE_SDK_LOCATION:$APPENGINE_SDK_LOCATION/lib/django-1.4"
export DJANGO_SETTINGS_MODULE="{{ project_name }}.settings_appengine"

if [ $1 == "deploy" ] ; then
    appcfg.py --oauth2 update .
else
    env/bin/python mywebsite/manage.py $@
fi


