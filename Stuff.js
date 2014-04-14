curl -XPUT 'http://localhost:9200/_river/mongodb/_meta' -d '{ 
"type": "mongodb", 
    "mongodb": { 
        "db": "mydb", 
        "options": {
            "drop_collection": true,
            "import_all_collections": true
        }
    }, 
    "index": {
        "name": "mydb"
    }
}'

curl -XPUT "localhost:9200/_river/mongoscriptfilter/_meta" -d'
{
    "type": "mongodb",
        "mongodb": {
            "db": "mydb", 
            "collection": "testData", 
            "script": "ctx.document.point_x = ctx.document.x; delete ctx.document.x;"
        },
        "index": {
            "name": "testscript", 
            "type": "testData"
        }
}'

curl -XPUT "localhost:9200/_river/mongotrans/_meta" -d'
{
    "type": "mongodb",
        "mongodb": {
            "db": "mydb", 
            "options": {
                "drop_collection": true,
                "import_all_collections": true
            }, 
            "script": "ctx.document.point_x = ctx.document.x; ctx.document.point_z = ctx.document.j; delete ctx.document.x; delete ctx.document.j;"
        },
        "index": {
            "name": "mongotrans"
        }
}'
var data = {
    "ContentType": "image", //Type
    "CreatedOn": {
        "date": date
    },
    "HeadLine": "beautiful picture " +1,
    "Provider": "AAP",
    "PubStatus": "usable", //Status
    "Renditions": [
    {
        "_cls": "RenditionMapped",
        "ContentURL": "http://pictures.com/beautiful.jpg",
        "Name": "default",
        "Width": 100,
        "Height": 40
    }
    ],
        "Type": "resource",
        "Version": 1,
        "VersionOn": {
            "date": date
        },
        "_cls": "ItemMapped.ItemResourceMapped.ItemImageMapped"
};

curl -XPUT "localhost:9200/_river/images/_meta" -d'
{
    type: "mongodb",
    mongodb: {
            "db": "mydb", 
            "options": {
                "drop_collection": true,
                "import_all_collections": true
            }, 
            "script": "ctx.document.Type = ctx.document.ContentType; ctx.document.Status = ctx.document.PubStatus; ctx.document.VersionOn = ctx.document.VersionOn.date; ctx.document.CreatedOn = ctx.document.CreatedOn.date; if(ctx.document.Renditions.length > 0) { var oldRenditions = ctx.document.Renditions; var newRenditions = {}; for(var i = 0; i < oldRenditions.length; i++){ var currentRend = oldRenditions[i]; var name = currentRend.Name; currentRend.href = currentRend.ContentURL; delete currentRend.Name; delete currentRend.ContentURL; delete currentRend._cls; newRenditions[name] = currentRend; } ctx.document.Renditions = newRenditions; } delete ctx.document.ContentType; delete ctx.document.PubStatus; delete ctx.document._cls;"
       },
    "index": {
            "name": "images"
        }
}'

var transform = function(){
    ctx.document.Type = ctx.document.ContentType; 
    ctx.document.Status = ctx.document.PubStatus; 
    ctx.document.VersionOn = ctx.document.VersionOn.date; 
    ctx.document.CreatedOn = ctx.document.CreatedOn.date; 
    if(ctx.document.Renditions.length > 0)
    {
        var oldRenditions = ctx.document.Renditions;
        var newRenditions = {};
        for(var i = 0; i < oldRenditions.length; i++){
            var currentRend = oldRenditions[i];
            var name = currentRend.Name;
            currentRend.href = currentRend.ContentURL;

            delete currentRend.Name;
            delete currentRend.ContentURL;
            delete currentRend._cls;
            newRenditions[name] = currentRend;
        }
        ctx.document.Renditions = newRenditions;
    }

    delete ctx.document.ContentType; 
    delete ctx.document.PubStatus; 
    delete ctx.document._cls;
}

for (var i = 5000; i <= 15000; i++) db.sampleData.insert( { j: i*i, name: "mongo script test" + i, x : i, point_y: i*2, even : i % 2 } )

var insertImages = function(from, to) {
    for (var i = from; i <= to; i++) {
        var date = new Date().getTime();
        var data = {
            "ContentType": "image",
            "CreatedOn": {
                "date": date
            },
            "HeadLine": "beautiful picture " +1,
            "Provider": "AAP",
            "PubStatus": "usable",
            "Renditions": [
            {
                "_cls": "RenditionMapped",
                "ContentURL": "http://pictures.com/beautiful.jpg",
                "Name": "default",
                "Width": 100,
                "Height": 40
            }
            ],
                "Type": "resource",
                "Version": 1,
                "VersionOn": {
                    "date": date
                },
                "_cls": "ItemMapped.ItemResourceMapped.ItemImageMapped"
        };
        db.sampleData.insert(data);
    }
}

{
    type: "mongodb",
    mongodb: {
        db: "mydb", 
        collection: "sampleData",
        options: {
            "drop_collection": true
        }, 
        script: "ctx.document.Type = ctx.document.ContentType; ctx.document.Status = ctx.document.PubStatus; ctx.document.VersionOn = ctx.document.VersionOn.date; ctx.document.CreatedOn = ctx.document.CreatedOn.date; if(ctx.document.Renditions.length > 0) { var oldRenditions = ctx.document.Renditions; var newRenditions = {}; for(var i = 0; i < oldRenditions.length; i++){ var currentRend = oldRenditions[i]; var name = currentRend.Name; currentRend.href = currentRend.ContentURL; delete currentRend.Name; delete currentRend.ContentURL; delete currentRend._cls; newRenditions[name] = currentRend; } ctx.document.Renditions = newRenditions; } delete ctx.document.ContentType; delete ctx.document.PubStatus; delete ctx.document._cls;"
    },
    index: {
        name: "content_image"
    }
}


curl -XGET http://localhost:9200/mydb/mockData/5347a380576c784f2112df34?pretty=true
curl -XGET http://localhost:9200/mydb/_search?query:match_all | python -mjson.tool
