require 'faker'
require "open-uri"

puts "Destroying previous data..."

Message.destroy_all
Chatroom.destroy_all
Flashcard.destroy_all
Review.destroy_all
Rental.destroy_all
Slot.destroy_all
User.destroy_all
Agency.destroy_all
Category.destroy_all
Offer.destroy_all

puts "Data destroyed, start seeding ..."

#Seed of agency
agency1 = Agency.new({
  name: "Paris agency"
})
agency1.save!

agency2 = Agency.new({
  name: "Outdoor Trip"
})
agency2.save!

agency3 = Agency.new({
  name: "Evaneos"
})
agency3.save!

agency4 = Agency.new({
  name: "Tahiti Experiences"
})
agency4.save!

agency5 = Agency.new({
  name: "World Travelers Agency"
})
agency5.save!

agency6 = Agency.new({
  name: "Luxurious Trips"
})
agency6.save!


#Seed of users
raph = User.new({
  first_name: "Raphaël",
  last_name: "Grelon",
  email: "raph@gmail.com",
  is_guide: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})
raph.agency = agency1
raph.save!

nico = User.new({
  first_name: "Nicolas",
  last_name: "Delfour",
  email: "nico@gmail.com",
  is_guide: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})
nico.agency = agency2
nico.save!

julien = User.new({
  first_name: "Julien",
  last_name: "Kiang",
  email: "julien@gmail.com",
  is_guide: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})
julien.agency = agency3
julien.save!

antho = User.new({
  first_name: "Anthony",
  last_name: "Jacquemin",
  email: "antho@gmail.com",
  is_guide: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})
antho.agency = agency4
antho.save!

agents = [raph, nico, antho, julien]

fake_users = []

20.times do
  user = User.new({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    is_guide: false,
    password: "PASSWORD",
    password_confirmation: "PASSWORD"
  })
    user.agency = agency1
    user.save!
    fake_users << user
end

#Seed of category
category1 = Category.new({
  name: "Neighborhood"
})
category1.save!

category2 = Category.new({
  name: "Museum"
})
category2.save!

category3 = Category.new({
  name: "Monument"
})
category3.save!

categories = [category1, category2, category3]

#Seed of offers

offer1 = Offer.new({
  address: "Villa Gaudelet",
  description: "Là où la magie opère...",
  video_type: "Both",
  city: "Paris",
  title: "La 8ème merveille du monde",
  price: rand(5.0..10.0).round(1)
})

offer1.user = raph
offer1.category = category3

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,h_240,q_auto,w_520/v1573658235/jj8r6pg0je6ldjiwktat.webp")
offer1.photos.attach(io: file, filename: "#{offer1.title}-1")

file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFJz0Gonzr6LHJ_0rOeIxrQvV-E4FFTX52jA&usqp=CAU")
offer1.photos.attach(io: file, filename: "#{offer1.title}-2")

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,h_522,w_1000/v1596821544/c7qciahbutrpoi4o0bi9.jpg")
offer1.photos.attach(io: file, filename: "#{offer1.title}-3")

offer1.save!

offer2 = Offer.new({
  address: "Rue Recamier",
  description: "Rpz le 75007...",
  video_type: "Live",
  city: "Paris",
  title: "La caverne de Raph",
  price: rand(5.0..10.0).round(1)
})

offer2.user = raph
offer2.category = category3
file = URI.open("https://st2.depositphotos.com/1465075/8929/i/600/depositphotos_89292306-stock-photo-buried-treasure-in-a-cave.jpg")
offer2.photos.attach(io: file, filename: "#{offer2.title}-1")

file = URI.open("https://st2.depositphotos.com/1465075/8929/i/600/depositphotos_89292306-stock-photo-buried-treasure-in-a-cave.jpg")
offer2.photos.attach(io: file, filename: "#{offer2.title}-2")

file = URI.open("https://st2.depositphotos.com/1465075/8929/i/600/depositphotos_89292306-stock-photo-buried-treasure-in-a-cave.jpg")
offer2.photos.attach(io: file, filename: "#{offer2.title}-3")
offer2.save!

offer3 = Offer.new({
  address: "Boulevard des plages",
  description: "Située au nord de la station, La Barre est la plus petite plage d’Anglet. Elle est aussi marquée par la proximité de l’embouchure de l’Adour. Très encaissée entre 2 longs épis, elle est la plus calme du littoral. Elle porte les stigmates de l’Occupation : des blockhaus aménagés en terrasse, qui agrémentent une promenade très agréable.",
  video_type: "Live",
  city: "Biarritz",
  title: "Sables d'or",
  price: rand(5.0..10.0).round(1)
})

offer3.user = nico
offer3.category = category1
file = URI.open("https://tourisme.biarritz.fr/sites/default/files/grande_plage_biarritz.jpg")
offer3.photos.attach(io: file, filename: "#{offer3.title}-1")

file = URI.open("https://tourisme.biarritz.fr/sites/default/files/Plage%20Miramar%201.jpg")
offer3.photos.attach(io: file, filename: "#{offer3.title}-2")

file = URI.open("https://www.biarritz-pays-basque.com/wp-content/uploads/2019/05/plages-en-famille-3-jpg.jpg")
offer3.photos.attach(io: file, filename: "#{offer3.title}-3")
offer3.save!

offer4 = Offer.new({
  address: "Centre-ville",
  description: "Arcangues, rendu célèbre par LUIS MARIANO, est un magnifique village vallonné qui a le charme d'un décor d'opérette.",
  video_type: "Live",
  city: "Arcangues",
  title: "Arcangues",
  price: rand(5.0..10.0).round(1)
})

offer4.user = nico
offer4.category = category1
file = URI.open("https://www.barnes-cotebasque.com/uploads/posts/24/pictures/2775/show_detail.jpg?1605257263")
offer4.photos.attach(io: file, filename: "#{offer4.title}-1")

file = URI.open("https://www.mediabask.eus/media/asset_publics/resources/000/855/264/article_main_landscape/chateau.jpg")
offer4.photos.attach(io: file, filename: "#{offer4.title}-2")

file = URI.open("https://images.ctfassets.net/zfxytrk6nf7m/20KMrrsQdzSwAN63TM0W64/076628d9b1b0e8ed30db30a7b2bd291d/17-04-21-Corpo-Golf-Darcangues-20-03-46-1280.jpg?q=90&fl=progressive&fit=fill")
offer4.photos.attach(io: file, filename: "#{offer4.title}-3")
offer4.save!

offer5 = Offer.new({
  address: "Centre-ville",
  description: "Un lieu de loisirs entouré de son décor monumental à l'antique très en vogue au XVIIIe siècle. C'est un des endroits de déambulation favoris des Parisiens et des touristes. La Comédie-Française, le théâtre du Palais-Royal et le restaurant Le Grand Véfour, au décor classé monument historique, contribuent à sa notoriété. L'art contemporain y est également fortement présent dans sa cour d'honneur avec les colonnes de Buren et deux fontaines mobiles de Pol Bury (1985). ",
  video_type: "Both",
  city: "Paris",
  title: "Palais Royal",
  price: rand(5.0..10.0).round(1)
})

#gg
offer5.user = julien
offer5.category = category1
file = URI.open("https://vivreparis.fr/wp-content/uploads/2021/03/palais-royal-paris.jpg")
offer5.photos.attach(io: file, filename: "#{offer5.title}-1")

file = URI.open("https://www.carigami.fr/magazine/wp-content/uploads/2017/11/paris-palais-royal-colonnes-buren.jpg")
offer5.photos.attach(io: file, filename: "#{offer5.title}-2")

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/ce/Jardins_du_Palais_Royal.JPG")
offer5.photos.attach(io: file, filename: "#{offer5.title}-3")
offer5.save!

offer6 = Offer.new({
  address: "704 Dorsoduro",
  description: "La collection Peggy Guggenheim est un ensemble d'œuvres d'art accumulées au cours de sa vie par la collectionneuse et mécène Peggy Guggenheim (1898-1979). ",
  video_type: "Live",
  city: "Venise",
  title: "Le Guggenheim",
  price: rand(5.0..10.0).round(1)
})

offer6.user = julien
offer6.category = category2
file = URI.open("https://cdn.getyourguide.com/img/tour/5e9d64e06a79f.jpeg/146.jpg")
offer6.photos.attach(io: file, filename: "#{offer6.title}-1")

file = URI.open("https://les-bons-plans-de-venise.com/wp-content/uploads/2019/08/Guggenheim_08-1024x662-1024x662.jpg")
offer6.photos.attach(io: file, filename: "#{offer6.title}-2")

file = URI.open("https://media.zonzofox.com/cities/venezia/geoplaces/poi/800x400/venezia-collezione-peggy-guggenheim.jpg")
offer6.photos.attach(io: file, filename: "#{offer6.title}-3")
offer6.save!



offer7 = Offer.new({
  address: "Place de l'étoile",
  description: "Un haut lieu des grandes manifestations nationales. Souhaité par Napoléon Ier dès 1806, l'Arc de triomphe est inauguré en 1836 par le roi des Français, Louis-Philippe, qui le dédie aux armées de la Révolution et de l'Empire. Le Soldat inconnu est inhumé sur le terre-plein en 1921. La flamme du souvenir est ravivée tous les jours à 18h30.",
  video_type: "Both",
  city: "Paris",
  title: "Arc de Triomphe",
  price: rand(5.0..10.0).round(1)
})

offer7.user = antho
offer7.category = category3
file = URI.open("https://www.sortiraparis.com/images/80/1467/523194-visuel-paris-arc-de-triomphe.jpg")
offer7.photos.attach(io: file, filename: "#{offer7.title}-1")

file = URI.open("https://images.rtl.fr/~c/770v513/rtl/www/1480131-le-drapeau-de-l-europe-deploye-sous-l-arc-de-triomphe.jpg")
offer7.photos.attach(io: file, filename: "#{offer7.title}-2")

file = URI.open("https://www.connaissancedesarts.com/wp-content/thumbnails/uploads/2021/09/sans-titre-2021-09-20t124748-156-tt-width-970-height-545-fill-1-crop-0-bgcolor-ffffff.jpg")
offer7.photos.attach(io: file, filename: "#{offer7.title}-3")
offer7.save!

offer8 = Offer.new({
  address: "Rue de Rivoli",
  description: "Ancien palais des rois, le Louvre épouse l’histoire de France depuis huit siècles. Conçu dès sa création en 1793 comme un musée universel, ses collections, qui figurent parmi les plus belles au monde, couvrent plusieurs millénaires et un territoire qui s’étend de l’Amérique aux frontières de l’Asie.",
  video_type: "Both",
  city: "Paris",
  title: "Le Louvre",
  price: rand(5.0..10.0).round(1)
})

offer8.user = antho
offer8.category = category2
file = URI.open("https://api-www.louvre.fr/sites/default/files/2021-01/cour-napoleon-et-pyramide_1.jpg")
offer8.photos.attach(io: file, filename: "#{offer8.title}-1")

file = URI.open("https://api-www.louvre.fr/sites/default/files/2021-03/la-grande-galerie.jpg")
offer8.photos.attach(io: file, filename: "#{offer8.title}-2")

file = URI.open("https://cdn.getyourguide.com/img/tour/5d4c31d4123d3.jpeg/99.jpg")
offer8.photos.attach(io: file, filename: "#{offer8.title}-3")
offer8.save!


offer9 = Offer.new({
  address: "Rue Beaubourg",
  description: "Le centre national d’art et de culture Georges-Pompidou (CNAC) – communément appelé « centre Pompidou », ou plus familièrement « Beaubourg » – est un établissement pluridisciplinaire né de la volonté du président Georges Pompidou, grand amateur d'art moderne, de créer au cœur de Paris une institution culturelle originale entièrement vouée à la création moderne et contemporaine.",
  video_type: "Both",
  city: "Paris",
  title: "Le Centre Pompidou",
  price: rand(5.0..10.0).round(1)
})

offer9.user = antho
offer9.category = category2
file = URI.open("https://www.guide-artistique.com/images/header/musee-georges-pompidou.jpg")
offer9.photos.attach(io: file, filename: "#{offer9.title}-1")

file = URI.open("https://media.lesechos.com/api/v1/images/view/5ca44cdc3e454605f4225865/1280x720/0601006628268-web-tete.jpg")
offer9.photos.attach(io: file, filename: "#{offer9.title}-2")

file = URI.open("https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/f/e/c/fec811f655_41848_5390906463-97075f60ab-b.jpg")
offer9.photos.attach(io: file, filename: "#{offer9.title}-3")
offer9.save!


offer10 = Offer.new({
  address: "Praia da Urca",
  description: "Le Pain de Sucre (Pão de Açúcar en portugais), est un monolithe et un inselberg granitique situé dans la ville de Rio de Janeiro au Brésil. Il culmine à 396 mètres d'altitude et est accessible par un téléphérique.",
  video_type: "VoD",
  city: "Rio de Janeiro",
  title: "Pão de Açúcar",
  price: rand(5.0..10.0).round(1)
})

offer10.user = antho
offer10.category = category3
file = URI.open("https://cdn.pixabay.com/photo/2014/10/22/20/50/sugar-loaf-pao-de-acucar-498931_960_720.jpg")
offer10.photos.attach(io: file, filename: "#{offer10.title}-1")

file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIgkZUFoV9To9rcz7eVwRzsSMCxiUD0UhmUw&usqp=CAU")
offer10.photos.attach(io: file, filename: "#{offer10.title}-2")

file = URI.open("https://img.locationscout.net/images/2017-09/pao-de-acucar-brazil_l.jpeg")
offer10.photos.attach(io: file, filename: "#{offer10.title}-3")
offer10.save!

offer11 = Offer.new({
  address: "Alto da Boa Vista",
  description: "Le Corcovado (« bossu » en portugaisa) est l'un des nombreux reliefs de la ville de Rio de Janeiro. Il s'élève à 704 mètres d'altitude. Il est célèbre pour accueillir en son sommet la statue du Christ Rédempteur, l'un des principaux symboles de la ville et du pays, et pour offrir une vue sur l'ensemble de la zone sud de la ville.",
  video_type: "Both",
  city: "Rio de Janeiro",
  title: "Corcovado",
  price: rand(5.0..10.0).round(1)
})

offer11.user = julien
offer11.category = category3
file = URI.open("https://dfz61940ba5vp.cloudfront.net/wp-content/uploads/2014/10/10131924/Corcovado.jpg")
offer11.photos.attach(io: file, filename: "#{offer11.title}-1")

file = URI.open("https://media.tacdn.com/media/attractions-splice-spp-674x446/06/74/29/14.jpg")
offer11.photos.attach(io: file, filename: "#{offer11.title}-2")

file = URI.open("https://media.tacdn.com/media/attractions-splice-spp-674x446/09/9c/cc/57.jpg")
offer11.photos.attach(io: file, filename: "#{offer11.title}-3")
offer11.save!

offer12 = Offer.new({
  address: "Praia de Copacabana",
  description: "Copacabana est un quartier de Rio de Janeiro au Brésil. Il est situé au sud de la ville. Le quartier comprend la plage du même nom, longue de 4,5 km, l'une des plages les plus célèbres de la planète.",
  video_type: "VoD",
  city: "Rio de Janeiro",
  title: "Copacabana",
  price: rand(5.0..10.0).round(1)
})

offer12.user = julien
offer12.category = category1
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/57/8a/a2/copacabana.jpg?w=1000&h=800&s=1")
offer12.photos.attach(io: file, filename: "#{offer12.title}-1")

file = URI.open("https://imgs-akamai.mnstatic.com/77/d2/77d2558a5cb5f05e0d73e89f9c2774dc.jpg?quality=75&format=pjpg&fit=bounds&width=980&height=880")
offer12.photos.attach(io: file, filename: "#{offer12.title}-2")

file = URI.open("https://img.itinari.com/pages/images/original/2592f836-c717-4e8a-83cc-13ce934834c8-istock-473089840.jpg?ch=DPR&dpr=2.625&w=1200&h=800&s=a5859b88c58b458d3861ce979bb3dcd7")
offer12.photos.attach(io: file, filename: "#{offer12.title}-3")
offer12.save!

offer13 = Offer.new({
  address: "Quai d'Orsay",
  description: "Le musée possède la plus importante collection de peintures impressionnistes et postimpressionnistes au monde, avec près de 1 100 toiles3 au total sur plus de 3 650, et l’on peut y voir des chefs-d’œuvre de la peinture et de la sculpture.",
  video_type: "Live",
  city: "Paris",
  title: "Musée d'Orsay",
  price: rand(5.0..10.0).round(1)
})

offer13.user = nico
offer13.category = category2
file = URI.open("https://reservation.parisinfo.com/InfoliveImages/culture_et_loisirs/musee/orsay/musee_orsay_-_copyright_graham-h.jpg?mode=crop&width=640&height=412&scale=both&quality=100")
offer13.photos.attach(io: file, filename: "#{offer13.title}-1")

file = URI.open("https://media.timeout.com/images/105581784/image.jpg")
offer13.photos.attach(io: file, filename: "#{offer13.title}-2")

file = URI.open("https://www.connaissancedesarts.com/wp-content/thumbnails/uploads/2020/03/cda2020_musee_d_orsay_don_20_millions_d_euros-tt-width-1200-height-630-fill-0-crop-1-bgcolor-ffffff.jpg")
offer13.photos.attach(io: file, filename: "#{offer13.title}-3")
offer13.save!

offer14 = Offer.new({
  address: "Millbank",
  description: "La Tate Britain, appelée Tate Galerie jusqu'en 2000, est l'un des musées du réseau Tate avec la Tate Modern, la Tate Liverpool et la Tate St Ives. Elle est située sur le site d'une ancienne prison à Millbank. ",
  video_type: "Both",
  city: "Londres",
  title: "Tate Museum",
  price: rand(5.0..10.0).round(1)
})

offer14.user = nico
offer14.category = category2
file = URI.open("https://blog.direct-d-sign.com/wp-content/uploads/2008/12/Tate-Modern-London.jpg")
offer14.photos.attach(io: file, filename: "#{offer14.title}-1")

file = URI.open("https://i.f1g.fr/media/madame/1900x1900_crop/sites/default/files/img/2016/06/1000x1000.jpg")
offer14.photos.attach(io: file, filename: "#{offer14.title}-2")

file = URI.open("https://cdn.londonandpartners.com/asset/0b22ccc16e730f88bce83d19d86f2ca1.jpg")
offer14.photos.attach(io: file, filename: "#{offer14.title}-3")
offer14.save!

offer15 = Offer.new({
  address: "House of commons",
  description: "Big Ben est le surnom de la grande cloche de 13,5 tonnes se trouvant au sommet de la tour Élisabeth (Elizabeth Tower).",
  video_type: "VoD",
  city: "Londres",
  title: "Big Ben",
  price: rand(5.0..10.0).round(1)
})

offer15.user = raph
offer15.category = category3
file = URI.open("https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FFAC.2Fvar.2Ffemmeactuelle.2Fstorage.2Fimages.2Factu.2Fnews-actu.2Fbig-ben-londres-42286.2F14653510-1-fre-FR.2Fla-celebre-cloche-big-ben-a-londres-ne-sonne-plus.2Ejpg/750x562/quality/80/crop-from/center/cr/wqkgSXN0b2NrIC8gRmVtbWUgQWN0dWVsbGU%3D/la-celebre-cloche-big-ben-a-londres-ne-sonne-plus.jpeg")
offer15.photos.attach(io: file, filename: "#{offer15.title}-1")

file = URI.open("https://cdn.radiofrance.fr/s3/cruiser-production/2017/08/3650420d-0fa3-4719-b2e2-829695eb47c8/1280x680_075_pezzali-notitle170814_nprjn.jpg")
offer15.photos.attach(io: file, filename: "#{offer15.title}-2")

file = URI.open("https://geo.img.pmdstatic.net/fit/https.3A.2F.2Fi.2Epmdstatic.2Enet.2Fgeo.2F2021.2F12.2F21.2F5d2df5d2-15e6-4190-b1af-c90880cd2cd5.2Ejpeg/1200x630/cr/wqkgYWh1bmR0IC8gUGl4YWJheSAvIEdFTw%3D%3D/a-londres-big-ben-sonnera-pour-le-nouvel-an-avant-la-fin-de-sa-restauration.jpg")
offer15.photos.attach(io: file, filename: "#{offer15.title}-3")
offer15.save!

offer16 = Offer.new({
  address: "20 Deans Yd",
  description: "L’abbaye de Westminster est l'un des édifices religieux les plus célèbres de Londres. Sa construction date pour l'essentiel du XIIIᵉ siècle, sous Henri III.",
  video_type: "Live",
  city: "Londres",
  title: "Westminster Abbey",
  price: rand(5.0..10.0).round(1)
})

offer16.user = raph
offer16.category = category3
file = URI.open("https://cdn.londonandpartners.com/asset/westminster-abbey_westminster-abbey-copyright-shutterstock-image-courtesy-of-shutterstock_9ac64ccf26eadb50669d288736e98f65.jpg")
offer16.photos.attach(io: file, filename: "#{offer16.title}-1")

file = URI.open("https://media.istockphoto.com/photos/westminster-abbey-in-westminster-london-england-uk-picture-id1189247818?k=20&m=1189247818&s=170667a&w=0&h=gnAix7LIsGh_9UPh82Du1j7vfmK3a4tl_8cV5GltIJs=")
offer16.photos.attach(io: file, filename: "#{offer16.title}-2")

file = URI.open("https://www.clondres.com/wp-content/uploads/sites/5/2018/03/interieur-westminster-abbaye.jpg")
offer16.photos.attach(io: file, filename: "#{offer16.title}-3")
offer16.save!

video_type = ["Live", "VoD", "Both"]
offers = [offer1, offer2, offer3, offer4, offer5, offer6, offer7, offer8, offer9, offer10, offer11, offer12, offer13, offer14, offer15, offer16]

20.times do
  offer = Offer.new({
    address: Faker::Address.street_name,
    description: Faker::Lorem.sentences(number: 3),
    video_type: video_type.sample,
    city: Faker::Address.city,
    title: Faker::Mountain.name,
    price: rand(5.0..10.0).round(1)
    })

  offer.user = fake_users.sample
  offer.category = categories.sample
  file = URI.open("https://store-images.s-microsoft.com/image/apps.23032.13608622719434797.30372fd8-b4bd-41c0-beea-1c2a61e087c1.a8347bb5-9305-48e8-b668-08df54c5a91a?w=672&h=378&q=80&mode=letterbox&background=%23FFE4E4E4&format=jpg")
  offer.photos.attach(io: file, filename: "#{offer.title}")
  offer.save!
  offers << offer
end


#Seed of slots

slots = []
100.times do
  date = DateTime.new(2022, rand(3..6), rand(1..28), rand(0..23), [0, 30].sample)
  slot = Slot.new({
    start_at: date
  })
  slot.offer = offers.sample
  slot.user = agents.sample
  slot.save!
  slots << slot
end

#Seed of rental

rentals = []
500.times do
  rental = Rental.new
  rental.user = fake_users.sample
  rental.slot = slots.sample
  rental.save!
  rentals << rental
end


#Seed of reviews

2000.times do
  review = Review.new({
  content: Faker::Lorem.sentences(number: 2),
  rating: rand(1..5)
  })
  review.rental = rentals.sample
  review.save!
end

#Seed of flashcards

120.times do
  flashcard = Flashcard.new({
    question: Faker::Lorem.sentences(number: 2),
    answer: Faker::Lorem.sentences(number: 1)
  })
  flashcard.offer = offers.sample
  flashcard.save!
end


####################"LOOGING THE RESULTS FOR TESTING"#############
puts "#############BEGGINING OF TESTS FOLLOWING SEED IMPLEMENTATION############"
p ""
p ""

p "-----------TEST IF SEED HAS BEEN ADDED----------"

puts "------------------Agency------------------"
agencies = Agency.all
p agencies
puts "-------------------------------------------"
puts ""

puts "------------------USERS------------------"
users = User.all
p users
puts "-------------------------------------------"
puts ""


puts "------------------OFFERS------------------"
offers = Offer.all
p offers
puts "-------------------------------------------"
puts ""

puts "------------------CATEGORIES------------------"
categories = Category.all
p categories
puts "-------------------------------------------"
puts ""

puts "------------------SLOTS------------------"
slots = Slot.all
p slots
puts "-------------------------------------------"
puts ""

puts "------------------RENTALS------------------"
rentals = Rental.all
p rentals
puts "-------------------------------------------"
puts ""

puts "------------------REVIEWS------------------"
reviews = Review.all
p reviews
puts "-------------------------------------------"
puts ""


puts "------------------Flashcard------------------"
flashcards = Flashcard.all
p flashcards
puts "-------------------------------------------"
puts ""


p "-----------TEST OF THROUGH and other Active record----------"

p "------------------Reach slots and reviews from offers------------------"
lewagon = Offer.find_by(title: "La 8ème merveille du monde")
p "slots from le wagon = #{lewagon.slots}"
p "rentals from le wagon = #{lewagon.rentals}"
p "reviews from le wagon = #{lewagon.reviews}"
puts ""
puts ""


p "-----------TEST OF Active records ----------"
# to be completed

puts "#########END OF TEST#########"
