## Create bucket
```sh
aws s3 mb s3://prefixes-fun-ab-1233
```

## Create folder
```sh
aws s3api put-object --bucket="prefixes-fun-ab-1233" --key="hello/" 
```

## Create many folder
```sh
aws s3api put-object --bucket="prefixes-fun-ab-1233" --key="Lorem/ipsum/dolor/sit/amet/consectetur/adipiscing/elit/Nunc/eu/scelerisque/est/ut/sollicitudin/sem/Proin/fringilla/ipsum/risus/vel/tempus/diam/vehicula/id/Duis/quis/cursus/tortor/In/interdum/porttitor/odio/vel/efficitur/Ut/in/sagittis/neque/Nullam/imperdiet/enim/sed/mattis/gravida/Nunc/aliquet/malesuada/justo/ut/rutrum/libero/tincidunt/nec/Cras/id/quam/feugiat/suscipit/sapien/eu/luctus/quam/Maecenas/ultrices/nibh/in/scelerisque/accumsan/augue/risus/bibendum/diam/vitae/aliquam/felis/orci/ac/erat/Fusce/facilisis/quam/non/bibendum/iaculis/quam/urna/accumsan/tellus/non/accumsan/diam/quam/vitae/ipsum/Vestibulum/nec/neque/id/augue/bibendum/tristique/vitae/a/urna/Fusce/mollis/aliquam/lectus/non/fringilla/lacus/semper/non/Phasellus/a/eros/vulputate/risus/tempor/hendrerit/ut/non/tortor/Aenean/fermentum/viverra/ornareSed/aliquam/enim/at/dignissim/ornare/Integer/vehicula/augue/non/porta/aliquet/massa/urna/ultrices/felis/quis/fermentum/tortor/nisi/in/lacus/Sed/dictum/pellentesque/posuereSed/aliquam/enim/at"


" 
``` 

### Try and break the 1024 limit