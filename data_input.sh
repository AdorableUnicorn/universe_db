#!/bin/bash

echo -e "\n~~ Universe Data Helper ~~\n"

PSQL="psql -U spaceunicorn -d universe -h localhost --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE galaxy, star, planet, moon, asteroid")



cat galaxy.csv | while IFS="," read STAR NAME SIZE INFO
do
    if [[ $STAR != "Number of Stars (Billion)" ]]
    then
        INSERT_DATA="$($PSQL "INSERT INTO galaxy(number_of_stars_bl, name, size, short_info) VALUES($STAR, '$NAME', $SIZE, '$INFO')")"
        if [[ $INSERT_DATA == "INSERT 0 1" ]]
        then
            echo "Inserted into galaxy: $NAME" 
        fi
    fi    
done

cat star.csv | while IFS="," read PLANETS NAME GALAXY INFO
do
    if [[ $PLANETS != "KnownPlanets" ]]
    then
        #get galaxy_id
        GALAXY_ID=$($PSQL "SELECT galaxy_id FROM galaxy WHERE name='$GALAXY'")
        INSERT_DATA=$($PSQL "INSERT INTO star(planets_inside, name, galaxy_id, short_info) VALUES($PLANETS, '$NAME', $GALAXY_ID, '$INFO')")
        if [[ $INSERT_DATA == "INSERT 0 1" ]]
        then
            echo "Inserted into star: $NAME" 
        fi
    fi
done

cat planet.csv | while IFS=',' read NAME MOONS STAR_NAME INFO HAVE_MOON HAVE_LIFE
do
    if [[ $NAME != "name" ]]
    then
        #get star_id
        STAR_ID=$($PSQL "SELECT star_id FROM star WHERE name='$STAR_NAME'")
        INSERT_DATA=$($PSQL "INSERT INTO planet(moons_around, name, star_id, more_info, have_moons, have_life) VALUES ($MOONS, '$NAME',$STAR_ID,'$INFO', $HAVE_MOON, $HAVE_LIFE)")
        if [[ $INSERT_DATA == "INSERT 0 1" ]]
        then
            echo "Inserted into planet: $NAME" 
        fi
    fi
done

cat moon.csv | while IFS="," read NAME PLANET INFO
do
    if [[ $NAME != "name" ]]
    then
        PLANET_ID=$($PSQL "SELECT planet_id FROM planet WHERE name='$PLANET'")
        INSERT_DATA=$($PSQL "INSERT INTO moon(name, planet_id, short_info) VALUES ('$NAME', $PLANET_ID, '$INFO')")
        if [[ $INSERT_DATA == "INSERT 0 1" ]]
        then
            echo "Inserted into moon: $NAME" 
        fi
    fi
done

cat asteroid.csv | while IFS="," read NAME STAR_NAME INFO
do
    if [[ $NAME != "name" ]]
    then
        #get star_id
        STAR_ID=$($PSQL "SELECT star_id FROM star WHERE name='$STAR_NAME'")
        INSERT_DATA=$($PSQL "INSERT INTO asteroid(name, star_id, short_info) VALUES ('$NAME',$STAR_ID, '$INFO')")
        if [[ $INSERT_DATA == "INSERT 0 1" ]]
        then
            echo "Inserted into asteroid: $NAME" 
        fi
    fi
done    
