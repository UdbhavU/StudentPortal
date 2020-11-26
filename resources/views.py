from django.shortcuts import render
from .models import Resource, Subject
from django.core.paginator import Paginator, EmptyPage ,PageNotAnInteger
# Create your views here.
context = {}
context["subjects"] = Subject.objects.all()
def viewResource(request,id):

    resourceList = Resource.objects.filter(subject=id)
    pageObj = Paginator(resourceList,5)
    try:
        pnum = request.GET.get("page")
        # pnum=1

        page = pageObj.page(pnum)
    except EmptyPage:
        page = pageObj.page(1)
    except PageNotAnInteger:
        page = pageObj.page(1)
    context["sid"]=id
    context["resource"] = page
    return render(request,'resources/resource.html',context)