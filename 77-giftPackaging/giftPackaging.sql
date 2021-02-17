CREATE PROCEDURE giftPackaging()
BEGIN
    SELECT package_type, COUNT(*) AS number FROM
    (
        SELECT id, package_type FROM
        (
            SELECT id, MIN(vol) AS packageVol FROM
                (SELECT id, gift_name, length, width, height, length * width * height AS volumn FROM gifts) AS gfts
                JOIN
                (SELECT package_type, length AS len, width AS wid, height AS hgt, length * width * height AS vol FROM packages) AS pkgs
                ON length <= len AND width <= wid && height <= hgt AND volumn <= vol
            GROUP BY gfts.id
        ) AS t1
        JOIN packages ON t1.packageVol = (packages.length*packages.height*packages.width)
    ) AS t2
    GROUP BY package_type
    ORDER BY package_type;
END