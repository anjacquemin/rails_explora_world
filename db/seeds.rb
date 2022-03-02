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
  price: rand(5.0..10.0)
})

offer1.user = raph
offer1.category = category1

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
  price: rand(5.0..10.0)
})

offer2.user = raph
offer2.category = category1
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
  price: rand(5.0..10.0)
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
  title: "Arcangueszoo",
  price: rand(5.0..10.0)
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
  price: rand(5.0..10.0)
})

offer5.user = julien
offer5.category = category1
file = URI.open("https://vivreparis.fr/wp-content/uploads/2021/03/palais-royal-paris.jpg")
offer5.photos.attach(io: file, filename: "#{offer5.title}-1")

file = URI.open("https://www.parisinfo.com/var/otcp/sites/images/media/1.-photos/80.-photos-sugar/lieux-de-loisirs-et-de-culture/domaine-national-du-palais-royal-1-630x405-c-e-revault-pour-cmn-paris/5050717-1-fre-FR/Domaine-national-du-Palais-Royal-1-630x405-C-E-Revault-pour-CMN-Paris.jpg")
offer5.photos.attach(io: file, filename: "#{offer5.title}-2")

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/ce/Jardins_du_Palais_Royal.JPG")
offer5.photos.attach(io: file, filename: "#{offer5.title}-3")
offer5.save!

offer6 = Offer.new({
  address: "Centre-ville",
  description: "Gughenheim de Venise, meilleur musée d'art contemporain",
  video_type: "Live",
  city: "Venise",
  title: "Le Gugenheim, Venise",
  price: rand(5.0..10.0)
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
  price: rand(5.0..10.0)
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
  price: rand(5.0..10.0)
})

offer8.user = antho
offer8.category = category1
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
  price: rand(5.0..10.0)
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
  price: rand(5.0..10.0)
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
  price: rand(5.0..10.0)
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
  price: rand(5.0..10.0)
})

offer12.user = julien
offer12.category = category1
file = URI.open("https://www.msccroisieres.fr/-/media/global-contents/destinations/ports/brazil/copacabana/cruise-to-copacabana-brazil.jpg?bc=transparent&as=1&dmc=0&iar=0&mh=537&mw=806&sc=0&thn=0&udi=0&hash=7684EE23C14ECC1C2140F825BA3DB427")
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
  price: rand(5.0..10.0)
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
  price: rand(5.0..10.0)
})

offer14.user = nico
offer14.category = category2
file = URI.open("https://blog.direct-d-sign.com/wp-content/uploads/2008/12/Tate-Modern-London.jpg")
offer14.photos.attach(io: file, filename: "#{offer14.title}-1")

file = URI.open("https://i.f1g.fr/media/madame/1900x1900_crop/sites/default/files/img/2016/06/1000x1000.jpg")
offer14.photos.attach(io: file, filename: "#{offer14.title}-2")

file = URI.open("data:image/jpeg;base64,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")
offer14.photos.attach(io: file, filename: "#{offer14.title}-3")
offer14.save!

offer15 = Offer.new({
  address: "House of commons",
  description: "Big Ben est le surnom de la grande cloche de 13,5 tonnes se trouvant au sommet de la tour Élisabeth (Elizabeth Tower).",
  video_type: "VoD",
  city: "Londres",
  title: "Big Ben",
  price: rand(5.0..10.0)
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
  price: rand(5.0..10.0)
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
offers = [offer1, offer2, offer3, offer4, offer5, offer6, offer7, offer8, offer9, offer10, offer11, offer12, offer13, offer14]

20.times do
  offer = Offer.new({
    address: Faker::Address.street_name,
    description: Faker::Lorem.sentences(number: 3),
    video_type: video_type.sample,
    city: Faker::Address.city,
    title: Faker::Lorem.sentence(word_count: 2),
    price: rand(5.0..10.0)
    })

  offer.user = fake_users.sample
  offer.category = categories.sample
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
